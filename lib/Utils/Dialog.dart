import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

showAlertDialog(
    BuildContext context, String btnName, String title, String message) {
  Widget okButton = FlatButton(
    child: Text(btnName),
    onPressed: () {
      Navigator.of(context).pop();
    },
  );
  AlertDialog alert = AlertDialog(
    title: Text(title),
    content: Text(message),
    actions: [
      okButton,
    ],
  );
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
