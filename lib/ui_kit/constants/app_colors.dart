import 'package:flutter/material.dart';

class AppColors {
  AppColors._();
  static const primary = Color(0xFFBEC8EC);
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
}
