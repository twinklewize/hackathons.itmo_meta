import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:ict_hack/entities/enventory_item.dart';
import '../entities/user_avatar_entity.dart';
import '../entities/user_entity.dart';
import 'package:ict_hack/entities/user_avatar_entity.dart';
import 'package:ict_hack/entities/user_entity.dart';

class UserProvider with ChangeNotifier {
  UserEntity userEntity = UserEntity(
    userAvatar: UserAvatarEntity(
      backgroundColorId: 0,
      bodyId: 0,
      browsId: 0,
      eyesId: 0,
      hairstyleId: 0,
      mouthId: 0,
    ),
    nickname: '',
    id: 0,
    coins: 1000,
    diamonds: 100,
    levelPoints: 10,
    inventoryItems: [],
    achievments: [0, 1, 3],
  );

  void setUserAvatar(UserAvatarEntity userAvatar) {
    userEntity.userAvatar = userAvatar;
    notifyListeners();
  }

  void setUserNickname(String nickname) {
    userEntity.nickname = nickname;
    notifyListeners();
  }

  // получение инфы о юзере по id
  Future<UserEntity?> findUser(int isu) async {
    UserEntity? result;
    final url =
        Uri.parse('http://172.28.96.206:2021/ItmoMeta/api/auth/findUser');
    final response = await http.post(
      url,
      headers: {HttpHeaders.contentTypeHeader: "application/json"},
      body: json.encode(
        {
          'isu': isu,
        },
      ),
    );
    print(response.statusCode);
    if (response.statusCode != 200) {
      print(response.statusCode);
    }
    print(response.body);
    notifyListeners();
    return result;
  }

  Future<void> getInventory() async {
    final url = Uri.parse(
        'http://172.28.96.206:2021/ItmoMeta/api/inventory/getInventory');
    final response = await http.post(
      url,
      headers: {HttpHeaders.contentTypeHeader: "application/json"},
      body: jsonEncode(
        {
          'isu': userEntity.id,
        },
      ),
    );
    print(response.statusCode);
    if (response.statusCode != 200) {
      print(response.statusCode);
    }
    print(response.body);

    if (response.statusCode == 200) {
      userEntity.inventoryItems.clear();
      for (var item in jsonDecode(response.body)) {
        EnventoryItem newItem = EnventoryItem(
          id: item['uniqId'],
          name: item['name'],
          imageAsset: item['imageUrl'],
          type: item['type'],
          rarity: item['rarity'],
          amount: 0,
        );
        userEntity.inventoryItems.add(newItem);
      }
    }
    notifyListeners();
  }

  // возвращает статус код
  // обновляет инфу о юзере на сервере
  Future<int> update() async {
    final url = Uri.parse('http://172.28.96.206:2021/ItmoMeta/api/auth/update');
    final response = await http.post(
      url,
      headers: {HttpHeaders.contentTypeHeader: "application/json"},
      body: json.encode(
        {
          'isu': userEntity.id,
          'password': 'https://www.youtube.com/watch?v=Kprv72YvACM',
          'username': userEntity.nickname,
          'coins': userEntity.coins,
          'diamonds': userEntity.diamonds,
          'levelPoints': userEntity.levelPoints,
          'skinColor': userEntity.userAvatar.bodyId,
          'backgroundColorId': userEntity.userAvatar.backgroundColorId,
          'browsId': userEntity.userAvatar.browsId,
          'eyesId': userEntity.userAvatar.eyesId,
          'hairstyleId': userEntity.userAvatar.hairstyleId,
          'mouthId': userEntity.userAvatar.mouthId,
          'pantsId': userEntity.userAvatar.pantsId,
          'tShortId': userEntity.userAvatar.tShirtId,
          'bootsId': userEntity.userAvatar.bootsId,
          'glassesId': userEntity.userAvatar.glassesId,
        },
      ),
    );
    print(json.encode(
      {
        'isu': userEntity.id,
        'password': 'https://www.youtube.com/watch?v=Kprv72YvACM',
        'username': userEntity.nickname,
        'coins': userEntity.coins,
        'diamonds': userEntity.diamonds,
        'levelPoints': userEntity.levelPoints,
        'skinColor': userEntity.userAvatar.bodyId,
        'backgroundColorId': userEntity.userAvatar.backgroundColorId,
        'browsId': userEntity.userAvatar.browsId,
        'eyesId': userEntity.userAvatar.eyesId,
        'hairstyleId': userEntity.userAvatar.hairstyleId,
        'mouthId': userEntity.userAvatar.mouthId,
        'pantsId': userEntity.userAvatar.pantsId,
        'tShortId': userEntity.userAvatar.tShirtId,
        'bootsId': userEntity.userAvatar.bootsId,
        'glassesId': userEntity.userAvatar.glassesId,
      },
    ));

    print(response.statusCode);
    if (response.statusCode != 200) {
      return response.statusCode;
    }
    print(response.body);
    notifyListeners();
    return response.statusCode;
  }
}
