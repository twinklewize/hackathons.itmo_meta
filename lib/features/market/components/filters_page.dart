import 'package:flutter/material.dart';
import 'package:ict_hack/providers/market_provider.dart';
import 'package:provider/provider.dart';

class FiltersPage extends StatelessWidget {
  const FiltersPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var marketProviderListen = Provider.of<MarketProvider>(context);
    var marketProviderCall = Provider.of<MarketProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Фильтры"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CheckboxListTile(
            title: const Text('Показывать вещи от магазина'),
            value: marketProviderListen.showItemsFromMarket,
            onChanged: (bool? value) {
              marketProviderCall.changeShowItemsFromMarket();
            },
            secondary: const Icon(Icons.shop),
          ),
          CheckboxListTile(
            title: const Text('Показывать вещи от других пользователей'),
            value: marketProviderListen.showItemsFromAnotherUsers,
            onChanged: (bool? value) {
              marketProviderCall.changesShowItemsFromAnotherUsers();
            },
            secondary: const Icon(Icons.people_alt),
          ),
          CheckboxListTile(
            title: const Text('Показывать обычные вещи'),
            value: marketProviderListen.showBasicItems,
            onChanged: (bool? value) {
              marketProviderCall.changeShowBasicItems();
            },
            secondary: const Icon(Icons.filter_1),
          ),
          CheckboxListTile(
            title: const Text('Показывать редкие вещи'),
            value: marketProviderListen.showRareItems,
            onChanged: (bool? value) {
              marketProviderCall.changeShowRareItems();
            },
            secondary: const Icon(Icons.filter_2),
          ),
          CheckboxListTile(
            title: const Text('Показывать легендарные вещи'),
            value: marketProviderListen.showLegendaryItems,
            onChanged: (bool? value) {
              marketProviderCall.changeShowLegendaryItems();
            },
            secondary: const Icon(Icons.filter_3),
          ),
        ],
      ),
    );
  }
}
