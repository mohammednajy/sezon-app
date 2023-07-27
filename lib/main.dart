import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:sezon_app/firebase_options.dart';
import 'package:sezon_app/services/authServices/auth_service.dart';
import 'package:sezon_app/services/sharedPref/shared_pref.dart';
import 'package:sezon_app/utils/languages.dart';
import 'package:sezon_app/utils/theme_manager.dart';
import 'package:sezon_app/feature/router/route_name.dart';
import 'package:sezon_app/feature/router/router.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPrefController().init();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform)
      .then((value) {
    Get.put(AuthService());
  
  });

  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  ));
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitDown,
    DeviceOrientation.portraitUp,
  ]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeManager.theme,
      initialRoute: SharedPrefController().getLoggedIn()
          ? RouteName.mainRoute
          : RouteName.loginRoute,
      getPages: AppRoute.routes,
      translations: Languages(),
      locale: Locale('ar'),
    );
  }
}
