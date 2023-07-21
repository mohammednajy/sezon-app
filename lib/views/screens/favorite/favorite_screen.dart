import 'package:flutter/material.dart';

import '../../../utils/assets_path.dart';
import '../../../utils/color_manager.dart';
import '../../../utils/style_manager.dart';
import '../../widgets/custome_appbar.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'favorite'),
      body: ListView.separated(
        padding: const EdgeInsets.only(left: 16, right: 16, top: 20),
        separatorBuilder: (context, index) => const Divider(),
        itemCount: 15,
        itemBuilder: (context, index) => Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              flex: 2,
              child: Image.asset(
                AssetPath.product,
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
                  Text('خزف ملون صنع يدوي',
                      style: StyleManager.smallText(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      )),
                  const Text(
                    'هذا النص هو مثال لنص يمكن أن يستبدل \nتوليد هذا النص من مولد النص العربى...',
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    '190ر.س',
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
                  onPressed: () {},
                  icon: const Icon(
                    Icons.delete,
                    color: ColorManager.redColor,
                  )),
            )
          ],
        ),
      ),
    );
  }
}
