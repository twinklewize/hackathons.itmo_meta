import 'package:flutter/material.dart';
import 'package:ict_hack/entities/enventory_item.dart';

class MarketProvider with ChangeNotifier {
  // список вещей в сторе
  List<EnventoryItem> itemsInMarket = [
    EnventoryItem(
      id: 'id0',
      name: 'Худи',
      uniqId: 'uniqId0',
      imageAsset: 'assets/images/hoodie.png',
      type: 'Одежда',
      rarity: 'Basic',
      amount: 25,
    ),
    EnventoryItem(
      id: 'id1',
      uniqId: 'uniqId1',
      name: 'Худи 2',
      imageAsset: 'assets/images/hoodie_2.png',
      type: 'Одежда',
      rarity: 'Basic',
      amount: 35,
    ),
    EnventoryItem(
      id: 'id2',
      name: 'Бластер',
      uniqId: 'uniqId2',
      imageAsset: 'assets/images/blaster.png',
      type: 'В руку',
      rarity: 'Rare',
      amount: 100,
    ),
    EnventoryItem(
      id: 'id3',
      uniqId: 'uniqId3',
      name: 'Шляпа ковбоя',
      imageAsset: 'assets/images/cowboy-hat.png',
      type: 'Шапки',
      rarity: 'Legendary',
      amount: 50,
    ),
  ];

  List<EnventoryItem> getItemsForCategory(String category) {
    List<EnventoryItem> result = [];
    for (var item in itemsInMarket) {
      if (item.type == category) {
        result.add(item);
      }
    }
    return result;
  }

  // активные фильтры
  bool showItemsFromMarket = true;
  bool showItemsFromAnotherUsers = true;
  bool showBasicItems = true;
  bool showRareItems = true;
  bool showLegendaryItems = true;

  void changesShowItemsFromAnotherUsers() {
    showItemsFromAnotherUsers = !showItemsFromAnotherUsers;
    notifyListeners();
  }

  void changeShowItemsFromMarket() {
    showItemsFromMarket = !showItemsFromMarket;
    notifyListeners();
  }

  void changeShowBasicItems() {
    showBasicItems = !showBasicItems;
    notifyListeners();
  }

  void changeShowRareItems() {
    showRareItems = !showRareItems;
    notifyListeners();
  }

  void changeShowLegendaryItems() {
    showLegendaryItems = !showLegendaryItems;
    notifyListeners();
  }
}
