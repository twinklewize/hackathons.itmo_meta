import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import '../entities/enventory_item.dart';
import '../entities/trade.dart';
import 'package:http/http.dart' as http;

class ShopProvider with ChangeNotifier {
  // список наименований в магазине (каталог)
  List<Trade> lots = [];

  // список вещей в shop
  List<EnventoryItem> itemsInShop = [
    // EnventoryItem(
    //   id: 0,
    //   name: 'Худи',
    //   uniqId: 0,
    //   imageAsset: 'assets/images/hoodie.png',
    //   type: 'Одежда',
    //   rarity: 'Basic',
    //   amount: 25,
    // ),
    // EnventoryItem(
    //   id: 1,
    //   uniqId: 1,
    //   name: 'Худи 2',
    //   imageAsset: 'assets/images/hoodie_2.png',
    //   type: 'Одежда',
    //   rarity: 'Basic',
    //   amount: 35,
    // ),
    // EnventoryItem(
    //   id: 2,
    //   name: 'Бластер',
    //   uniqId: 2,
    //   imageAsset: 'assets/images/blaster.png',
    //   type: 'В руку',
    //   rarity: 'Rare',
    //   amount: 100,
    // ),
    // EnventoryItem(
    //   id: 3,
    //   uniqId: 3,
    //   name: 'Шляпа ковбоя',
    //   imageAsset: 'assets/images/cowboy-hat.png',
    //   type: 'Шапки',
    //   rarity: 'Legendary',
    //   amount: 50,
    // ),
  ];

  Future<void> getShop() async {
    final url =
        Uri.parse('http://172.28.96.206:2021/ItmoMeta/api/shop/getShop');
    final response = await http.post(
      url,
      headers: {HttpHeaders.contentTypeHeader: "application/json"},
    );
    print(response.statusCode);
    if (response.statusCode != 200) {
      print(response.statusCode);
    }
    print(response.body);

    if (response.statusCode == 200) {
      var decodedResponse = json.decode(response.body);
      itemsInShop.clear();
      for (var item in decodedResponse) {
        EnventoryItem newItem = EnventoryItem(
          id: item['typeId'],
          name: item['name'],
          imageAsset: item['imageUrl'],
          type: item['type'],
          rarity: item['rarity'],
          amount: item['price'],
        );
        itemsInShop.add(newItem);
        notifyListeners();
      }
      print(itemsInShop.length);
    }
  }

  // покупка в магазине (от приложения)
  Future<void> buy(int typeId, int userId) async {
    final url = Uri.parse('http://172.28.96.206:2021/ItmoMeta/api/shop/buy');
    final response = await http.post(
      url,
      headers: {HttpHeaders.contentTypeHeader: "application/json"},
      body: json.encode(
        {
          'userId': userId,
          'lotId': typeId,
        },
      ),
    );
    print(response.statusCode);
    if (response.statusCode != 200) {
      print(response.statusCode);
    }
    print(response.body);
    notifyListeners();
  }
}
