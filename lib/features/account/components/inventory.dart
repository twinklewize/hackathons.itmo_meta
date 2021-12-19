import 'package:flutter/material.dart';
import 'package:ict_hack/ui_kit/avatar/user_avatar_assets.dart';

import '../../../ui_kit/constants/app_colors.dart';

class TabsWithInventoryElements extends StatefulWidget {
  const TabsWithInventoryElements({Key? key}) : super(key: key);

  @override
  _TabsWithInventoryElementsState createState() =>
      _TabsWithInventoryElementsState();
}

class _TabsWithInventoryElementsState extends State<TabsWithInventoryElements>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    tabController = TabController(length: 5, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.height,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TabBar(
                isScrollable: true,
                unselectedLabelColor: AppColors.textColor.withOpacity(0.5),
                indicatorColor: AppColors.primary,
                labelColor: AppColors.primary,
                indicatorWeight: 4,
                controller: tabController,
                tabs: const [
                  Tab(
                    text: 'Футболки',
                  ),
                  Tab(
                    text: 'Штаны',
                  ),
                  Tab(
                    text: 'Очки',
                  ),
                  Tab(
                    text: 'Обувь',
                  ),
                  Tab(
                    text: 'Другое',
                  ),
                ],
              ),
              Divider(height: 1, color: AppColors.textColor.withOpacity(0.2)),
            ],
          ),
        ),
        Expanded(
          child: TabBarView(
            controller: tabController,
            children: [
              InventoryGridView(
                assets: UserAvatarAssets.tShirts,
                onTap: (int value) {},
              ),
              InventoryGridView(
                assets: UserAvatarAssets.pants,
                onTap: (int value) {},
              ),
              InventoryGridView(
                assets: UserAvatarAssets.glasses,
                onTap: (int value) {},
              ),
              InventoryGridView(
                assets: UserAvatarAssets.boots,
                onTap: (int value) {},
              ),
              Text(''),
            ],
          ),
        )
      ],
    );
  }
}

class InventoryGridView extends StatelessWidget {
  const InventoryGridView({
    Key? key,
    required this.onTap,
    required this.assets,
  }) : super(key: key);
  final List<String> assets;
  final Function(int value) onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 120,
          mainAxisSpacing: 16,
          crossAxisSpacing: 16,
          childAspectRatio: 3 / 4,
        ),
        itemCount: assets.length,
        itemBuilder: (BuildContext ctx, index) {
          return ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Material(
              color: AppColors.backgroundLight,
              child: InkWell(
                onTap: () => onTap(index),
                child: Container(
                  width: 120,
                  height: 120,
                  padding: const EdgeInsets.all(16),
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(20)),
                  child: Column(
                    children: [
                      SizedBox(
                        width: 72,
                        height: 72,
                        child: Image.asset(
                          assets[index],
                          fit: BoxFit.contain,
                        ),
                      ),
                      const SizedBox(height: 16),
                      const Text(
                        'Футболка',
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: AppColors.textColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
