import 'package:flutter/material.dart';

class CustomAvatarViewModel with ChangeNotifier {
  int backgroundId = 0;
  int hairStyledId = 0;

  void setBackgroundId(int id) {
    backgroundId = id;
    notifyListeners();
  }
}
