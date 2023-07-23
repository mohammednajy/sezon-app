import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:sezon_app/utils/color_manager.dart';
import 'package:sezon_app/utils/style_manager.dart';
import 'package:sezon_app/feature/screens/orders/completed_orders_screen.dart';
import 'package:sezon_app/feature/screens/orders/on_progress_orders_screen.dart';

import '../../widgets/custome_appbar.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: CustomAppBar(
          height: 100,
          title: 'orders',
          bottom: TabBar(
            indicatorSize: TabBarIndicatorSize.tab,
            indicatorColor: ColorManager.redColor,
            labelStyle: StyleManager.headline2,
            labelColor: Colors.black,
            tabs: [
              Tab(
                text: 'طلبات قيد التنفيذ',
              ),
              Tab(
                text: 'طلبات مستلمة',
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            OnProgressOrders(),
            CompletedOrders(),
          ],
        ),
      ),
    );
  }
}
