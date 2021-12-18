import 'package:flutter/material.dart';
import 'package:ict_hack/entities/user_avatar_entity.dart';

class CustomAvatarViewModel with ChangeNotifier {
  late UserAvatarEntity userAvatar;
  String nickname = '';

  void setUserAvatar(UserAvatarEntity userAvatarEntity) {
    userAvatar = userAvatarEntity;
  }

  void setBackgroundId(int id) {
    userAvatar.backgroundColorId = id;
    notifyListeners();
  }

  void setHairstyleId(int id) {
    userAvatar.hairstyleId = id;
    notifyListeners();
  }

  void setBodyId(int id) {
    userAvatar.bodyId = id;
    notifyListeners();
  }

  void setBrowsId(int id) {
    userAvatar.browsId = id;
    notifyListeners();
  }

  void setEyesId(int id) {
    userAvatar.eyesId = id;
    notifyListeners();
  }

  void setMouthId(int id) {
    userAvatar.mouthId = id;
    notifyListeners();
  }

  void setNickname(String nick) {
    nickname = nick;
  }
}
