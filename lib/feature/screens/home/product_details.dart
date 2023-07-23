import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sezon_app/utils/assets_path.dart';
import 'package:sezon_app/utils/color_manager.dart';
import 'package:sezon_app/feature/screens/home/homeComponent/label_widget.dart';
import 'package:sezon_app/feature/widgets/product_widget.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../utils/style_manager.dart';

class ProductDetailScreen extends StatefulWidget {
  const ProductDetailScreen({super.key});

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  PageController pageController = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(Icons.arrow_back_ios)),
        title: Text(
          'تفاصيل المنتج',
          style: StyleManager.headline1(fontSize: 18),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                SizedBox(
                  height: 230,
                  child: PageView.builder(
                    controller: pageController,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) => Hero(
                      tag: UniqueKey(),
                      child: Image.asset(
                        AssetPath.productDetails,
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                    itemCount: 3,
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Align(
                  alignment: Alignment.center,
                  child: SmoothPageIndicator(
                    controller: pageController,
                    count: 3,
                    effect: const WormEffect(
                      dotHeight: 12,
                      dotWidth: 15,
                      activeDotColor: ColorManager.redColor,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                ListView(
                  shrinkWrap: true,
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  physics: const NeverScrollableScrollPhysics(),
                  children: [
                    Text(
                      'صواني مطرزة تطريز فلسطيني',
                      style: StyleManager.headline1(fontSize: 16),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      '130 ر.س',
                      style: StyleManager.smallText(
                        color: ColorManager.redColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      'هذا النص هو مثال لنص يمكن أن يستبدل في نفس المساحة،المساحة،المساحة،المساحة،المساحة،المساحة،المساحة،المساحة، لقد تم0',
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    const LabelWidget(
                      text: 'منتجات ذات صلة',
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      height: 170,
                      child: ListView.separated(
                        separatorBuilder: (context, index) => const SizedBox(
                          width: 10,
                        ),
                        physics: const BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        itemCount: 20,
                        itemBuilder: (context, index) => const SizedBox(
                          height: 155,
                          width: 119,
                          child: ProductWidget(
                            imageHeight: 83,
                            favoriteSize: 15,
                            image:
                                'https://firebasestorage.googleapis.com/v0/b/sezon-app-6d877.appspot.com/o/%D8%AA%D8%B7%D8%B1%D9%8A%D8%B21.png?alt=media&token=d0ee7685-85e6-4368-a637-381297f9e530',
                            name: 'dummy data',
                            price: '200',
                          ),
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 26),
            child: Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          shadowColor: Colors.white,
                          surfaceTintColor: Colors.white,
                          shape: const RoundedRectangleBorder(
                              side: BorderSide(color: ColorManager.redColor),
                              borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(5),
                                  bottomRight: Radius.circular(5)))),
                      child: Text(
                        'إضافة إلى المفضلة',
                        style: StyleManager.smallText(
                            fontWeight: FontWeight.bold,
                            color: ColorManager.redColor),
                      )),
                ),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                        shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(5),
                                bottomLeft: Radius.circular(5)))),
                    child: Text(
                      'شراء الان',
                      style: StyleManager.smallText(
                          fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          )
        ],
      ),
    );
  }
}
