import 'package:get/get.dart';
import 'package:sezon_app/feature/screens/profile/profile_controller.dart';

class ProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ProfileController());
  }
}
