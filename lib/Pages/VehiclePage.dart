import 'package:flutter/material.dart';
import 'package:mobileorderwaste/Widgets/VehicleWidget.dart';
import 'package:mobileorderwaste/Styles/GlobalStyles.dart';

class VehiclePage extends StatefulWidget {
  VehiclePage({Key key}) : super(key: key);
  static const routeName = '/Veichle';
  @override
  _VeichlePageState createState() => _VeichlePageState();
}

class _VeichlePageState extends State<VehiclePage> {
  GlobalTextInput textStyle = GlobalTextInput();
  @override
  Widget build(BuildContext context) {
    final String title = ModalRoute.of(context).settings.arguments;
    return Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: VeichleWidget(),
        floatingActionButton: Padding(
          padding: EdgeInsets.fromLTRB(35, 0, 0, 0),
          child: SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              child: Text('Ok'),
              onPressed: _onOkPress,
              style: textStyle.btnStyle(),
            ),
          ),
        ));
    //  )
  }

  void _onOkPress() {}
}
