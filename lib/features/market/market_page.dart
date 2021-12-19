import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
          bottom: TabBar(
            tabs: [
              Tab(
                icon: SvgPicture.asset(
                  'assets/icons/shopping-bag.svg',
                  color: AppColors.black,
                ),
              ),
              Tab(
                icon: SvgPicture.asset(
                  'assets/icons/users.svg',
                  color: AppColors.black,
                ),
              ),
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
