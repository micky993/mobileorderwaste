import 'package:flutter/material.dart';
import 'package:mobileorderwaste/Widgets/LoginFormWidget.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key key, this.title}) : super(key: key);
  final String title;
  static const routeName = '/Login';

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: UniqueKey(),
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: FormLoginW());
  }
}
