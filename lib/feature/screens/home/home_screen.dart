import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sezon_app/services/sharedPref/shared_pref.dart';
import 'package:sezon_app/feature/screens/home/home_controller.dart';

import '../../widgets/category_widget.dart';
import '../../widgets/custome_appbar.dart';
import '../../widgets/product_widget.dart';
import 'homeComponent/label_widget.dart';
import 'homeComponent/search_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    print(SharedPrefController().getId());
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const CustomAppBar(title: 'home'),
      body: ListView(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 20,
        ),
        children: [
          const SearchWidget(),
          const SizedBox(
            height: 31,
          ),
          const LabelWidget(text: 'category'),
          const SizedBox(
            height: 21,
          ),
          GetBuilder<HomeController>(
            init: HomeController(),
            builder: (controller) {
              print(controller.loading);
              return SizedBox(
                height: 75,
                child: ListView.separated(
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemCount: controller.categories.length,
                  separatorBuilder: (context, index) => const SizedBox(
                    width: 10,
                  ),
                  itemBuilder: (context, index) => controller.loading
                      ? CircularProgressIndicator()
                      : CategoryWidget(
                          category: controller.categories[index].name,
                          onTap: () {},
                          image: controller.categories[index].image,
                        ),
                ),
              );
            },
          ),
          const SizedBox(
            height: 31,
          ),
          LabelWidget(text: 'products'.tr),
          GetBuilder<HomeController>(
            init: HomeController(),
            builder: (homeController) {
              return GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 200,
                    childAspectRatio: 4 / 5,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10),
                itemBuilder: (_, index) => ProductWidget(
                  imageHeight: 135,
                  image: homeController.allProducts[index].image,
                  name: homeController.allProducts[index].name,
                  price: homeController.allProducts[index].price,
                ),
                itemCount: homeController.allProducts.length,
              );
            },
          )
        ],
      ),
    );
  }
}
