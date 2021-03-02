import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:mobileorderwaste/Models/LogoffModel.dart';
import 'package:mobileorderwaste/Models/UserModel.dart';
import 'package:mobileorderwaste/Services/Services.dart';
import 'package:mobileorderwaste/Models/GlobalModel.dart';
import 'package:intl/intl.dart';

external String get timeZoneName;

Future logOff(BuildContext context, {String equipment}) async {
  buildShowDialog(context);
  LoginUSer loginData = LoginUSer.getLogonData();
  D logoff = D();
  logoff.versionId = '42';
  (equipment != null) ? logoff.vehicleId = equipment : logoff.vehicleId = '';
  Logoff logoffData = Logoff(d: logoff);
  String json = logoffToJson(logoffData);
  String pathUri = GlobalDataModel.getValueMap('logoff');
  var uri = Uri.https(GlobalDataModel.getValueMap('host'), pathUri);
  final response =
      await GetService.postCall(uri, loginData.user, loginData.pwd, json)
          .whenComplete(() => Navigator.of(context).pop());
  if (!response.statusCode.toString().startsWith('2')) {
    analizeStatusCode(context, response.statusCode, response.body);
  } else {
    showAlertDialog(context, 'OK', '', 'Logoff effettuato con successo');
  }
}

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

void analizeStatusCode(BuildContext context, int code, String body) {
  String codeString = code.toString();
  String codePartial = codeString.substring(0, 2);
  switch (codePartial) {
    case '40':
      switch (code) {
        case 401:
          showAlertDialog(
              context, 'CHIUDI', 'Attenzione!', 'Username o Password errati');
          break;
        case 400:
          var jsonbody = json.decode(body);
          showAlertDialog(context, 'CHIUDI', 'Attenzione!',
              jsonbody['error']['message']['value']);
          break;
      }
      break;

      break;
    case '50':
      var jsonbody = json.decode(body);
      showAlertDialog(context, 'CHIUDI', 'Attenzione!',
          jsonbody['error']['message']['value']);
      break;
    case '30':

    default:
  }
}

buildShowDialog(BuildContext context) {
  return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Center(
          child: CircularProgressIndicator(),
        );
      });
}

String dateFromatter(String date) {
  DateTime convDate;
  String dateconv;
  RegExp exp = RegExp(r"(\d+)");
  Iterable<Match> matches = exp.allMatches(date);
  for (Match m in matches) {
    String match = m[0];
    int mat = int.parse(match);
    //convDate = DateTime.fromMicrosecondsSinceEpoch(mat).toString();
    convDate = DateTime.fromMillisecondsSinceEpoch(mat).toUtc().toLocal();
    final DateFormat format = DateFormat('dd/MM/yyyy');
    dateconv = format.format(convDate).toString();
  }
  return dateconv;
}

String zeroDelete(String value) {
  String noZero = int.parse(value).toString();
  return noZero;
}
