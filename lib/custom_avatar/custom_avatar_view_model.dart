import 'package:flutter/material.dart';

class CustomAvatarViewModel with ChangeNotifier {
  int backgroundColorId = 0;
  int hairstyleId = 0;
  int bodyId = 0;
  int browsId = 0;
  int eyesId = 0;
  int mouthId = 0;

  final int pantsId = 0;
  final int tShirtId = 0;
  final int bootsId = 0;
  final int glassesId = -1;

  String nickname = 'Nickname';

  void setBackgroundId(int id) {
    backgroundColorId = id;
    notifyListeners();
  }

  void setHairstyleId(int id) {
    hairstyleId = id;
    notifyListeners();
  }

  void setBodyId(int id) {
    bodyId = id;
    notifyListeners();
  }

  void setBrowsId(int id) {
    browsId = id;
    notifyListeners();
  }

  void setEyesId(int id) {
    eyesId = id;
    notifyListeners();
  }

  void setMouthId(int id) {
    mouthId = id;
    notifyListeners();
  }

  void setNickname(String nick) {
    nickname = nick;
  }

  void createAvatar() {}
}
