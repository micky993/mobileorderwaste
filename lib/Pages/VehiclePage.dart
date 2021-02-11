import 'package:flutter/material.dart';

class VehiclePage extends StatefulWidget {
  VehiclePage({Key key}) : super(key: key);
  static const routeName = '/Veichle';
  @override
  _VeichlePageState createState() => _VeichlePageState();
}

class _VeichlePageState extends State<VehiclePage> {
  @override
  Widget build(BuildContext context) {
    final String title = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Column(),
      persistentFooterButtons: <Widget>[Text("prova")],
    );
  }
}
