import 'package:flutter/material.dart';

class HalfLongButton extends StatelessWidget {
  HalfLongButton({
    Key? key,
    required this.fillColor,
    required this.titleTextColor,
    required this.title,
  }) : super(key: key);

  Color fillColor;
  Color titleTextColor;
  String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 2 - 15 - 15 - 7.5,
      height: 45,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(
          Radius.circular(10),
        ),
        color: fillColor,
      ),
      child: Center(
        child: Text(
          title,
          style: TextStyle(
            color: titleTextColor,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}
