import 'package:flutter/material.dart';
import 'package:ict_hack/features/market/components/ingame_categories_widget.dart';
import 'package:ict_hack/features/market/components/real_categories_widget.dart';

import '../../ui_kit/constants/app_colors.dart';

class MarketPage extends StatelessWidget {
  const MarketPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Маркет"),
          backgroundColor: AppColors.primary,
          actions: [
            Row(
              children: [
                Text('1000' + ' 🪙'),
                SizedBox(width: 12),
                Text('35' + ' 💎'),
                SizedBox(width: 12),
              ],
            ),
          ],
          bottom: const TabBar(
            tabs: [
              Tab(icon: Icon(Icons.shop_rounded)),
              Tab(icon: Icon(Icons.people_alt)),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            SingleChildScrollView(
              child: IngameCategoriesWidget(),
            ),
            SingleChildScrollView(
              child: RealCategoriesWidget(),
            ),
          ],
        ),
      ),
    );
  }
}
