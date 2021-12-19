import 'package:flutter/material.dart';
import 'package:ict_hack/features/market/components/market_widget.dart';
import 'package:provider/provider.dart';

import '../../../providers/shop_provider.dart';

class ShopWidget extends StatefulWidget {
  const ShopWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<ShopWidget> createState() => _ShopWidgetState();
}

class _ShopWidgetState extends State<ShopWidget> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero).then(
      (value) async {
        print('hello');
        await Provider.of<ShopProvider>(context, listen: false).getShop();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MarketCategoryWidget(
          title: 't_shirt',
          description:
              'Одежда, которую вы можете надеть на своего персонажа и показать его всем друзьям',
          imageAsset: 'assets/images/hoodie.png',
        ),
        MarketCategoryWidget(
          title: 'other',
          description: 'Говорят, с оружием в руках жить спокойнее. Проверим?',
          imageAsset: 'assets/images/blaster.png',
        ),
        MarketCategoryWidget(
          title: 'glasses',
          description: 'Чтоб не напекло бошку',
          imageAsset: 'assets/images/cowboy-hat.png',
        ),
        MarketCategoryWidget(
          title: 'Питомцы',
          description: 'Купи слона. Все говорят "нет коинов", а ты купи слона',
          imageAsset: 'assets/images/cat.png',
        ),
        MarketCategoryWidget(
          title: 'pants',
          description:
              'Мама сшила мне штаны из березовой коры, чтобы попа не потела, не кусали комары',
          imageAsset: 'assets/images/pants.png',
        ),
        MarketCategoryWidget(
          title: 'boots',
          description: 'Ботики для котиков',
          imageAsset: 'assets/images/boot.png',
        ),
        MarketCategoryWidget(
          title: 'Скины',
          description:
              'Будь Наруто. Или Саске. Или Какаши. Или широким Путиным',
          imageAsset: 'assets/images/naruto_skin.png',
        ),
        MarketCategoryWidget(
          title: 'Кейсы',
          description: 'Да, как в бравл старсе',
          imageAsset: 'assets/images/treasure-chest.png',
        ),
      ],
    );
  }
}
