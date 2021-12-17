import 'package:flutter/material.dart';
import 'package:ict_hack/features/market/single_category_page.dart';

class MarketCategoryWidget extends StatelessWidget {
  MarketCategoryWidget({
    Key? key,
    required this.title,
    required this.description,
    required this.imageAsset,
  }) : super(key: key);

  String title;
  String description;
  String imageAsset;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute<void>(
            builder: (BuildContext context) => SingleCategoryWidget(
              categoryName: title,
            ),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.only(top: 8, left: 8, right: 8),
        child: Container(
          color: Colors.blue[100],
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 12, right: 12),
                    child: SizedBox(
                      height: 50,
                      width: 50,
                      child: Image.asset(imageAsset),
                    ),
                  ),
                  Flexible(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      // ignore: prefer_const_literals_to_create_immutables
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 12, left: 12, right: 12),
                          child: Text(
                            title,
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 6, left: 12, bottom: 12, right: 12),
                          child: Text(
                            description,
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
