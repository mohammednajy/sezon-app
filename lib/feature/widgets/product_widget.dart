import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sezon_app/feature/router/route_name.dart';
import 'package:sezon_app/feature/screens/favorite/favorite_controller.dart';
import 'package:sezon_app/models/products_model.dart';

import '../../utils/color_manager.dart';
import '../../utils/style_manager.dart';

class ProductWidget extends StatefulWidget {
  const ProductWidget({
    required this.imageHeight,
    this.favoriteSize = 18,
    super.key,
    required this.productModel,
  });

  final double imageHeight;
  final double favoriteSize;

  final ProductModel productModel;

  @override
  State<ProductWidget> createState() => _ProductWidgetState();
}

class _ProductWidgetState extends State<ProductWidget> {
  @override
  void initState() {
    super.initState();
    print('initstateinitstateinitstateinitstateinitstateinitstate');
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.toNamed(RouteName.productDetailsRoute,
            arguments: widget.productModel);
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
                  height: widget.imageHeight,
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
                      widget.productModel.image,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                Text(
                  widget.productModel.name,
                  style: StyleManager.headline3,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  '${widget.productModel.price} ر.س',
                  style: StyleManager.smallText(
                    color: ColorManager.redColor,
                    fontWeight: FontWeight.bold,
                  ),
                )
              ],
            ),
          ),
          GetBuilder<FavoriteController>(
            builder: (controller) => Padding(
              padding: const EdgeInsets.only(top: 20, left: 20),
              child: InkWell(
                onTap: () {
                  controller.favorites.any(
                    (element) {
                      return element.id == widget.productModel.id;
                    },
                  )
                      ? controller.deleteFavorite(widget.productModel.id)
                      : controller.addToFavorites(widget.productModel);
                },
                child: CircleAvatar(
                  backgroundColor:
                      Colors.white.withOpacity(0.20000000298023224),
                  radius: widget.favoriteSize,
                  child: Icon(
                      controller.favorites.any(
                        (element) {
                          return element.id == widget.productModel.id;
                        },
                      )
                          ? Icons.favorite
                          : Icons.favorite_border_outlined,
                      color: Colors.white),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
