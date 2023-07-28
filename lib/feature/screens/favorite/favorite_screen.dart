import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sezon_app/feature/screens/favorite/favorite_controller.dart';

import '../../../utils/color_manager.dart';
import '../../../utils/style_manager.dart';
import '../../widgets/custome_appbar.dart';

class FavoriteScreen extends GetView<FavoriteController> {
  var cont = Get.put(FavoriteController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'favorite'),
      body: GetBuilder<FavoriteController>(
        builder: (favorite) => favorite.loading
            ? const Center(child: CircularProgressIndicator())
            : ListView.separated(
                padding: const EdgeInsets.only(left: 16, right: 16, top: 20),
                separatorBuilder: (context, index) => const Divider(),
                itemCount: favorite.favorites.length,
                itemBuilder: (context, index) => Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      flex: 2,
                      child: Image.network(
                        favorite.favorites[index].image,
                        height: 80,
                        fit: BoxFit.fill,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      flex: 4,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(favorite.favorites[index].name,
                              style: StyleManager.smallText(
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              )),
                          Text(
                            favorite.favorites[index].details,
                            overflow: TextOverflow.ellipsis,
                          ),
                          Text(
                            '${favorite.favorites[index].price}.س',
                            style: StyleManager.smallText(
                              color: ColorManager.redColor,
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: IconButton(
                          onPressed: () {
                            favorite
                                .deleteFavorite(favorite.favorites[index].id);
                          },
                          icon: const Icon(
                            Icons.delete,
                            color: ColorManager.redColor,
                          )),
                    )
                  ],
                ),
              ),
      ),
    );
  }
}
