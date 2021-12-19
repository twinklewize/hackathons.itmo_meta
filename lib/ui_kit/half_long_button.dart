import 'package:flutter/material.dart';

class HalfLongButton extends StatelessWidget {
  HalfLongButton({
    Key? key,
    required this.fillColor,
    required this.titleTextColor,
    required this.title,
    this.emoji = '',
  }) : super(key: key);

  Color fillColor;
  Color titleTextColor;
  String title;
  String emoji;

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
        child: RichText(
          text: TextSpan(
            children: <TextSpan>[
              TextSpan(
                text: title,
                style: TextStyle(
                  color: titleTextColor,
                  fontSize: 16,
                ),
              ),
              TextSpan(
                text: emoji,
                style: const TextStyle(
                  fontFamily: 'EmojiOne',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
