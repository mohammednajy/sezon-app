import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sezon_app/models/user_model.dart';
import 'package:sezon_app/services/authServices/phone_auth_exceptions.dart';
import 'package:sezon_app/feature/router/route_name.dart';

import '../sharedPref/shared_pref.dart';

class AuthService extends GetxController {
  static AuthService get instance => Get.find();

  final _auth = FirebaseAuth.instance;

  late final Rx<User?> firebaseUser;
  var verificationId = ''.obs;
  final _db = FirebaseFirestore.instance;

  @override
  void onReady() {
    firebaseUser = Rx<User?>(_auth.currentUser);
    firebaseUser.bindStream(_auth.userChanges());
    ever(firebaseUser, (callback) => _setInitialScreen);
  }

  createUser(UserModel user) async {
    var ref = await _db.collection('Users').add(user.toJson());
    SharedPrefController().login(user);
    SharedPrefController().setId(id: ref.id);
  }

  Future<bool> login(
      {required String userName, required String password}) async {
    final snapshot = await _db
        .collection('Users')
        .where('FullName', isEqualTo: userName)
        .where('Password', isEqualTo: password)
        .get();

    if (snapshot.docs.isNotEmpty) {
      SharedPrefController().login(snapshot.docs.map((e) {
        SharedPrefController().setId(id: e.id);
        return UserModel.fromSnapshot(e);
      }).single);
      return true;
    } else {
      return false;
    }
  }

  _setInitialScreen(User? user) {
    user == null
        ? Get.offAllNamed(RouteName.loginRoute)
        : Get.offAllNamed(RouteName.mainRoute);
  }

  Future<bool> _checkUser(String phone) async {
    final snapshot =
        await _db.collection('Users').where('Phone', isEqualTo: phone).get();
    return snapshot.docs.isEmpty ? true : false;
  }

  Future<String> phoneVerification({required String phoneNumber}) async {
    String result = '';
    if (await _checkUser(phoneNumber)) {
      _auth.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        verificationCompleted: (phoneAuthCredential) {
          _auth.signInWithCredential(phoneAuthCredential);
        },
        verificationFailed: (error) {
          if (error.code == 'invalid-phone-number') {
            result = 'invalid phone number';
          } else {
            result = 'something went wrong';
          }
        },
        codeSent: (verificationId, forceResendingToken) {
          this.verificationId.value = verificationId;
        },
        codeAutoRetrievalTimeout: (verificationId) {
          this.verificationId.value = verificationId;
        },
      );
    } else {
      result = 'Phone Number Already taken';
    }
    return result;
  }

  Future<String> verifyCode({required String otpCode}) async {
    try {
      var credential = await _auth.signInWithCredential(
          PhoneAuthProvider.credential(
              verificationId: verificationId.value, smsCode: otpCode));

      return '';
    } on Exception catch (e) {
      if (e is FirebaseAuthException) {
        return PhoneAuthExceptionHandler.handleException(e);
      }
      return 'something went wrong';
    }
  }

  signOut() async => await FirebaseAuth.instance.signOut();
}
