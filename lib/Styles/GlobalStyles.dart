import 'package:flutter/material.dart';

class GlobalTextInput {
  String text;
  InputDecoration inputDeco(text) {
    return InputDecoration(
        border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(8))),
        labelText: text);
  }

  ButtonStyle btnStyle() {
    return ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(Colors.red[900]));
  }
}
