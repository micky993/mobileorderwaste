import 'package:flutter/material.dart';
import 'package:confirm_dialog/confirm_dialog.dart';
import 'package:mobileorderwaste/Utils/Utils.dart' as util;
import 'package:mobileorderwaste/Pages/LoginPage.dart';
import 'package:mobileorderwaste/Models/UserModel.dart';
import 'package:mobileorderwaste/Widgets/OrderWidget.dart';

class OrderPage extends StatefulWidget {
  OrderPage({Key key}) : super(key: key);
  static const routeName = '/Order';
  @override
  _OrderPageState createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
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
                  })
            ],
          )
        ],
      ),
      body: OrderWidget(),
    );
  }
}
