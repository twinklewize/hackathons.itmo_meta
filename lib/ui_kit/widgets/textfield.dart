import 'package:flutter/material.dart';

// ignore: must_be_immutable
class MyTextField extends StatelessWidget {
  Function(String?) onChanged;
  TextEditingController controller;
  Color fillColor;
  String labelText;
  TextInputType? keyboardType;
  TextInputAction? textInputAction;
  int? maxLines;
  int? minLines;
  Color inputTextColor;

  MyTextField({
    required this.onChanged,
    required this.controller,
    required this.fillColor,
    required this.labelText,
    required this.keyboardType,
    this.textInputAction = TextInputAction.next,
    required this.maxLines,
    required this.minLines,
    required this.inputTextColor,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: (val) {
        onChanged(val);
      },
      controller: controller,
      cursorColor: Colors.blue,
      maxLines: maxLines,
      minLines: minLines,
      cursorRadius: const Radius.circular(2),
      textInputAction: textInputAction,
      style: TextStyle(color: inputTextColor),
      decoration: InputDecoration(
        isDense: true,
        contentPadding: // Text Field height
            const EdgeInsets.only(
          top: 14,
          bottom: 14,
          right: 14,
          //left: 14,
        ),
        fillColor: fillColor,
        filled: true,
        floatingLabelBehavior: FloatingLabelBehavior.never,
        labelText: "     " + labelText,
        labelStyle: const TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 16,
          color: Color.fromRGBO(255, 255, 255, 0.2),
        ),
        prefixText: '    ',
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide:
              const BorderSide(color: Color.fromRGBO(255, 255, 255, 0.2)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide:
              const BorderSide(color: Color.fromRGBO(255, 255, 255, 0.2)),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide:
              const BorderSide(color: Color.fromRGBO(255, 255, 255, 0.2)),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide:
              const BorderSide(color: Color.fromRGBO(255, 255, 255, 0.2)),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: const BorderSide(
            color: Colors.red,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: const BorderSide(
            color: Colors.red,
          ),
        ),
      ),
      keyboardType: keyboardType,
    );
  }
}
