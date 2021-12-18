import 'package:flutter/material.dart';
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
  );

  void setUserAvatar(UserAvatarEntity userAvatar) {
    userEntity.userAvatar = userAvatar;
    notifyListeners();
  }

  void setUserNickname(String nickname) {
    userEntity.nickname = nickname;
    notifyListeners();
  }
}
