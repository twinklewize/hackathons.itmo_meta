import 'package:flutter/material.dart';
import 'package:ict_hack/features/market/filters_page.dart';
import 'package:ict_hack/providers/market_provider.dart';
import 'package:ict_hack/ui_kit/half_long_button.dart';
import 'package:provider/provider.dart';

class SingleCategoryWidget extends StatelessWidget {
  SingleCategoryWidget({
    Key? key,
    required this.categoryName,
  }) : super(key: key);

  String categoryName;

  @override
  Widget build(BuildContext context) {
    var appBar = AppBar(
      title: Text(categoryName),
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
                      color: Colors.blue[100],
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
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(12),
                            child: Text(
                              items[index].rarity,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {},
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
