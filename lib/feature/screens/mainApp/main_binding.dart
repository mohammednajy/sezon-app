import 'package:get/get.dart';
import 'package:sezon_app/feature/screens/mainApp/main_controller.dart';

class MainBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MainController());
  }
}
