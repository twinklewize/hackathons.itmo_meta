import 'package:flutter/material.dart';
import 'package:ict_hack/entities/enventory_item.dart';
import 'package:ict_hack/features/market/components/filters_page.dart';
import 'package:ict_hack/providers/market_provider.dart';
import 'package:ict_hack/ui_kit/half_long_button.dart';
import 'package:ict_hack/ui_kit/universal_moodal_bottom_sheet.dart';
import 'package:provider/provider.dart';

import '../../../ui_kit/constants/app_colors.dart';

class SingleCategoryWidget extends StatelessWidget {
  SingleCategoryWidget({
    Key? key,
    required this.categoryName,
  }) : super(key: key);

  String categoryName;

  void onBuyButtonPressed(BuildContext context, EnventoryItem item) {
    showModalBottomSheet<void>(
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      context: context,
      builder: (BuildContext context) {
        return UniversaModalBottomSheet(
          title: "Вы уверены?",
          content: Column(
            children: [
              const SizedBox(height: 12),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Text(
                  "Вы уверены, что хотите купить " +
                      item.name +
                      " за " +
                      item.amount.toString() +
                      (item.rarity == "Legendary" ? ' 💎' : ' 🪙' + "?"),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 8),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 12),
                child: Text(
                  "Средства будут списаны, а предмет сразу появится у вас в инвентаре",
                  textAlign: TextAlign.center,
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
                      fillColor: Colors.red,
                      titleTextColor: Colors.white,
                      title: 'Нет',
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: HalfLongButton(
                      fillColor: Colors.green,
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

  @override
  Widget build(BuildContext context) {
    var appBar = AppBar(
      title: Text(categoryName),
      backgroundColor: AppColors.primary,
      actions: [
        IconButton(
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute<void>(
                builder: (BuildContext context) => FiltersPage(),
              ),
            );
          },
          icon: Icon(Icons.filter_alt_outlined),
        ),
      ],
    );
    var items =
        Provider.of<MarketProvider>(context).getItemsForCategory(categoryName);
    return Scaffold(
      appBar: appBar,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height -
                  MediaQuery.of(context).padding.top -
                  appBar.preferredSize.height -
                  16,
              width: MediaQuery.of(context).size.width,
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 200,
                  childAspectRatio: 2 / 2,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                ),
                itemCount: items.length,
                itemBuilder: (BuildContext ctx, index) {
                  return InkWell(
                    onTap: () {},
                    child: Container(
                      color: AppColors.primary,
                      width: (MediaQuery.of(context).size.width - 60) / 3,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(12),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: SizedBox(
                                height: 60,
                                width: 60,
                                child: Image.asset(
                                  items[index].imageAsset,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 12),
                            child: Text(
                              items[index].name,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 16,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8),
                            child: Text(
                              items[index].rarity,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              onBuyButtonPressed(context, items[index]);
                            },
                            child: SizedBox(
                              height: 36,
                              child: HalfLongButton(
                                fillColor: Colors.green,
                                titleTextColor: Colors.white,
                                title: items[index].amount.toString() +
                                    (items[index].rarity == "Legendary"
                                        ? ' 💎'
                                        : ' 🪙'),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
