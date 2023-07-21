import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sezon_app/views/router/route_name.dart';

import '../../utils/assets_path.dart';
import '../../utils/color_manager.dart';
import '../../utils/style_manager.dart';

class ProductWidget extends StatelessWidget {
  const ProductWidget({
    required this.imageHeight,
    this.favoriteSize = 18,
    super.key,
    required this.image,
    required this.name,
    required this.price,
  });
  final double imageHeight;
  final double favoriteSize;
  final String image;
  final String name;
  final String price;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.toNamed(RouteName.productDetailsRoute);
      },
      child: Stack(
        alignment: Alignment.topLeft,
        children: [
          Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: const [
                BoxShadow(
                  color: Color(0x0C000000),
                  blurRadius: 20,
                  spreadRadius: 1,
                )
              ],
              borderRadius: BorderRadius.circular(6),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  height: imageHeight,
                  width: double.infinity,
                  padding: EdgeInsets.zero,
                  // margin: const EdgeInsets.only(bottom: 10),
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Hero(
                    tag: UniqueKey(),
                    child: Image.network(
                      image,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                Text(
                  name,
                  style: StyleManager.headline3,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  '$price ر.س',
                  style: StyleManager.smallText(
                    color: ColorManager.redColor,
                    fontWeight: FontWeight.bold,
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20, left: 20),
            child: InkWell(
              onTap: () {
                print('object');
              },
              child: CircleAvatar(
                backgroundColor: Colors.white.withOpacity(0.20000000298023224),
                radius: favoriteSize,
                child: const Icon(
                  Icons.favorite,
                  color: Colors.white,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
