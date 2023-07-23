import 'package:get/get.dart';
import 'package:sezon_app/feature/screens/auth/register/register_controller.dart';

class RegisterBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => RegisterController());
  }
}
