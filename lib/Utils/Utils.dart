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

void analizeStatusCode(BuildContext context, int code) {
  switch (code) {
    case 401:
      showAlertDialog(
          context, 'CHIUDI', 'Attenzione!', 'Username o Password errati');
      break;
    case 400:
      showAlertDialog(
          context, 'CHIUDI', 'Attenzione!', 'Errore serivzio Odata');
      break;
    case 500:
      showAlertDialog(context, 'CHIUDI', 'Attenzione!', 'Errore Server');
      break;
    default:
  }
}
