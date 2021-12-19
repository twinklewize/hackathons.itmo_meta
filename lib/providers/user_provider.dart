import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
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
    id: 28564,
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
        Uri.parse('http://192.168.50.158:2021/ItmoMeta/api/auth/findUser');
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

  // возвращает статус код
  // обновляет инфу о юзере на сервере
  Future<int> update(UserEntity user) async {
    final url =
        Uri.parse('http://192.168.50.158:2021/ItmoMeta/api/auth/update');
    final response = await http.post(
      url,
      headers: {HttpHeaders.contentTypeHeader: "application/json"},
      body: json.encode(
        {
          'user': user,
        },
      ),
    );
    print(response.statusCode);
    if (response.statusCode != 200) {
      return response.statusCode;
    }
    print(response.body);
    notifyListeners();
    return response.statusCode;
  }
}
