import 'package:flutter/material.dart';
import 'package:ict_hack/ui_kit/avatar/user_avatar_assets.dart';

import '../../../ui_kit/constants/app_colors.dart';
import '../../../ui_kit/half_long_button.dart';
import '../../../ui_kit/universal_moodal_bottom_sheet.dart';
import '../../../ui_kit/widgets/custom_text_field.dart';

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
          maxCrossAxisExtent: 130,
          mainAxisSpacing: 16,
          crossAxisSpacing: 16,
          childAspectRatio: 3 / 4,
        ),
        itemCount: assets.length,
        itemBuilder: (BuildContext ctx, index) {
          return ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Material(
              color: AppColors.yellow,
              child: InkWell(
                // onTap: () => onTap(index),
                onTap: () {
                  onItemButton(context);
                },
                child: Container(
                  width: 120,
                  height: 120,
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(20)),
                  child: Column(
                    children: [
                      const Spacer(flex: 4),
                      SizedBox(
                        width: 60,
                        height: 60,
                        child: Image.asset(
                          assets[index],
                          fit: BoxFit.contain,
                        ),
                      ),
                      const Spacer(flex: 3),
                      const Text(
                        'Футболка',
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: AppColors.textColor,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const Spacer(flex: 1),
                      Text(
                        'Редкий',
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: AppColors.textColor.withOpacity(0.5),
                        ),
                      ),
                      const Spacer(flex: 4),
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

  void onItemButton(BuildContext context) {
    final priceController = TextEditingController();
    showModalBottomSheet<void>(
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      context: context,
      builder: (BuildContext context) {
        return UniversaModalBottomSheet(
          color: AppColors.backgroundLight,
          title: "Продать на маркете",
          content: Column(
            children: [
              const SizedBox(height: 16),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 12),
                child: Text("Вы уверены, что хотите продать Футболку?"),
              ),
              const SizedBox(height: 12),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: CustomTextField(
                  controller: priceController,
                  textInputType: TextInputType.number,
                  hintText: 'Цена:',
                ),
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: HalfLongButton(
                      fillColor: AppColors.red,
                      titleTextColor: Colors.white,
                      title: 'Нет',
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: HalfLongButton(
                      fillColor: AppColors.green,
                      titleTextColor: Colors.white,
                      title: 'Да',
                    ),
                  ),
                ],
              )
            ],
          ),
        );
      },
    );
  }
}
