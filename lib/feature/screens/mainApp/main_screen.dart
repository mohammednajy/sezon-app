import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sezon_app/utils/color_manager.dart';
import 'package:sezon_app/feature/screens/mainApp/main_controller.dart';

import '../home/home_controller.dart';

class MainScreen extends GetView<MainController> {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
      Get.put(HomeController());
    return Obx(() => Scaffold(
          body: controller.pages[controller.currentIndex.value],
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            onTap: (value) {
              controller.changeIndex(value);
            },
            selectedItemColor: ColorManager.redColor,
            currentIndex: controller.currentIndex.value,
            selectedLabelStyle: const TextStyle(
              fontWeight: FontWeight.w700,
            ),
            items: controller.tabs
                .map((e) => BottomNavigationBarItem(
                      icon: Icon(
                        e.icon,
                      ),
                      label: e.label.tr,
                    ))
                .toList(),
          ),
        ));
  }
}
