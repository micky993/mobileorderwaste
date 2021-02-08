import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mobileorderwaste/Models/LoginModel.dart';
import 'package:mobileorderwaste/Models/UserModel.dart';
import 'package:mobileorderwaste/Styles/GlobalStyles.dart';
import 'package:http/http.dart' as http;

class FormLoginW extends StatefulWidget {
  FormLoginW({Key key}) : super(key: key);

  @override
  _FormLoginWState createState() => _FormLoginWState();
}

class _FormLoginWState extends State<FormLoginW> {
  GlobalTextInput textStyle = GlobalTextInput();
  bool isLoginDisabled = true;
  Utente utente = Utente();
  TextEditingController usrController = TextEditingController();
  TextEditingController pswController = TextEditingController();

  @override
  void initState() {
    super.initState();
    usrController.addListener(formOnChanged);
    usrController.addListener(removeSomeChar);
    pswController.addListener(formOnChanged);
  }

  @override
  void dispose() {
    usrController.dispose();
    pswController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(16),
            child: TextField(
              decoration: textStyle.inputDeco('Username'),
              controller: usrController,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(16),
            child: TextField(
              obscureText: true,
              decoration: textStyle.inputDeco("Password"),
              controller: pswController,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(16),
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                child: Text('Login'),
                onPressed: isLoginDisabled ? null : _loginPressed,
                style: textStyle.btnStyle(),
              ),
            ),
          )
        ],
      ),
    );
  }

  void _loginPressed() {
    setState(() {
      utente.username = usrController.text;
      utente.password = pswController.text;
    });
    print("sono qui");
    Future<List<D>> lista = getLogon();
  }

  void formOnChanged() {
    setState(() {
      isLoginDisabled =
          (usrController.text.length == 0 || pswController.text.length == 0);
    });
  }

  void removeSomeChar() {
    final text = usrController.text
        .toLowerCase()
        .replaceAll("@", "")
        .replaceAll("#", "");

    usrController.value = usrController.value.copyWith(
      text: text,
      selection:
          TextSelection(baseOffset: text.length, extentOffset: text.length),
      composing: TextRange.empty,
    );
  }

  String basicAuthenticationHeader(String username, String password) {
    return 'Basic ' + base64Encode(utf8.encode('$username:$password'));
  }

  Future<List<D>> getLogon() async {
    //String basicAuth = 'Basic ' + 'ENG_04:Forzanapoli01';
    String basicAuth =
        'Basic ' + base64Encode(utf8.encode('ENG_04:Forzanapoli01'));
    print(basicAuth);
    String path_uri = '/sap/opu/odata/WATP/MOW_SRV/Logons(\'42\')';
    var uri = Uri.https('amafesplay.amaroma.it:8443', path_uri);
    print(uri);
    final response = await http.get(uri, headers: {
      'content-type': 'application/json',
      'accept': 'application/json',
      'authorization': basicAuth
    });
    print(response.statusCode);
    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      print(response.body);
      List<D> list = (loginresFromJson(response.body) as List).toList();
      D primo = D();
      print(primo.name);
      return list;
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
  }
}
