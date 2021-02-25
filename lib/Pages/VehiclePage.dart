import 'package:flutter/material.dart';
import 'package:mobileorderwaste/Pages/LoginPage.dart';
import 'package:mobileorderwaste/Widgets/VehicleWidget.dart';
import 'package:mobileorderwaste/Styles/GlobalStyles.dart';
import 'package:mobileorderwaste/Models/UserModel.dart';
import 'package:confirm_dialog/confirm_dialog.dart';
import 'package:mobileorderwaste/Utils/Utils.dart' as util;

class VehiclePage extends StatefulWidget {
  VehiclePage({Key key}) : super(key: key);
  static const routeName = '/Veichle';
  @override
  _VeichlePageState createState() => _VeichlePageState();
}

class _VeichlePageState extends State<VehiclePage> {
  GlobalTextInput textStyle = GlobalTextInput();
  LoginUSer loginData = LoginUSer.getLogonData();
  @override
  Widget build(BuildContext context) {
    final String title = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        actions: <Widget>[
          Row(
            children: [
              Text(loginData.user),
              IconButton(
                  icon: Icon(Icons.account_circle_rounded),
                  onPressed: () async {
                    if (await confirm(
                      context,
                      title: Text('Attenzione'),
                      content: Text('Vuoi effettuare il logout?'),
                      textOK: Text('Si'),
                      textCancel: Text('No'),
                    )) {
                      await util.logOff(context);
                      Navigator.pushReplacementNamed(
                          context, LoginPage.routeName,
                          arguments: 'Login');
                    }
                    //Navigator.of(context).pop();
                  })
            ],
          )
        ],
      ),
      body: VeichleWidget(),
    );
    //  )
  }
}
