import 'package:flutter/material.dart';

class CustomAvatarViewModel with ChangeNotifier {
  int backgroundId = 0;
  int hairStyledId = 0;

  final List<Color> backgroundColors = [
    const Color(0xFFA9DBEE),
    const Color(0xFFC5ACA9),
    const Color(0xFFE6E0C2),
    const Color(0xFFBAE2E4),
    const Color(0xFFFFD08A),
  ];

  void setBackgroundId(int id) {
    backgroundId = id;
    notifyListeners();
  }
}
