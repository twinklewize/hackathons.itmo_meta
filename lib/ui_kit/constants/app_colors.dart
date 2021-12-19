import 'package:flutter/material.dart';

class AppColors {
  AppColors._();
  static const primary = Color(0xFFCDD3F3);
  // static const primary = blue;
  static const background = Color(0xFFFFFFFF);
  static const backgroundLight = Color(0xFFEBEFFF);
  static const textColor = Color(0xFF000000);

  // Chat colors

  // цвет фона chat list tile
  static const chatRowBackgroundColor = Colors.white;

  // цвет текста chat list tile
  static const chatRowTextColor = Colors.black;

  // цвет фона info bubble
  static const infoBubbleItemBackgroundColor =
      Color.fromRGBO(109, 120, 133, 0.08);

  // цвет текста info bubble
  static const infoBubbleItemTextColor = Colors.grey;

  // цвет текста сообщения юзера
  static const myMessageTextColor = Colors.black;

  // цвет даты сообщения юзера
  static Color? myMessageDateTimeColor = Colors.grey[700];

  static const green = Color(0xFF9CC569);
  static const yellow = Color(0xFFF9DD7C);
  static const blue = Color(0xFFB3ADF7);
  static const red = Color(0xFFE7858E);
  static const black = Color(0xFF462C30);
  static const white = Color(0xFFF3F5E0);
}
