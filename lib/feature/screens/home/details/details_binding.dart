import 'package:get/get.dart';
import 'package:sezon_app/feature/screens/home/details/details_controller.dart';

class DetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => DetailsController());
  }
}
