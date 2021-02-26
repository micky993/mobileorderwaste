import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:mobileorderwaste/Services/Services.dart';
import 'package:mobileorderwaste/Models/GlobalModel.dart';
import 'package:mobileorderwaste/Models/UserModel.dart';
//import 'package:confirm_dialog/confirm_dialog.dart';
import 'package:mobileorderwaste/Utils/Utils.dart';
import 'package:mobileorderwaste/Models/OrderModel.dart';

class OrderWidget extends StatefulWidget {
  OrderWidget({Key key}) : super(key: key);

  @override
  _OrderWidgetState createState() => _OrderWidgetState();
}

class _OrderWidgetState extends State<OrderWidget> {
  @override
  Widget build(BuildContext context) {
    getOrders();
    return FutureBuilder(
      initialData: [],
      future: getOrders(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return builderSnap(context, snapshot);
      },
    );
  }
}

Future<List<Result>> getOrders() async {
  // buildShowDialog(context);
  String pathUri = GlobalDataModel.getValueMap('order');
  var uri = Uri.https(GlobalDataModel.getValueMap('host'), pathUri);
  LoginUSer loginData = LoginUSer.getLogonData();
  var response = await GetService.getCall(uri, logonData.user, logonData.pwd);
  //.whenComplete(() => Navigator.of(context).pop());
  if (response.statusCode == 200) {
    Orders orders = ordersFromJson(response.body);
    if (orders.d.results.isEmpty) {
      //   showAlertDialog(
      //      context, 'OK', 'Attenzione!', 'Nessun Wdo da prendere in carico');
    }
    return orders.d.results;
  } else {
    //  analizeStatusCode(context, response.statusCode, response.body);
  }
  return null;
}

Widget builderSnap(BuildContext context, AsyncSnapshot snapshot) {
  List<Result> order = snapshot.data;
  return ListView.builder(
      itemCount: order.length,
      itemBuilder: (context, index) {
        var item = order[index];
        return Slidable(
          actionPane: SlidableDrawerActionPane(),
          actionExtentRatio: 0.25,
          child: Container(
            color: Colors.white,
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.indigoAccent,
                child: Text('1'),
                foregroundColor: Colors.white,
              ),
              title: Text(item.orderNr),
              subtitle: Text('SlidableDrawerDelegate'),
            ),
          ),
          actions: <Widget>[
            IconSlideAction(
              caption: 'Archive',
              color: Colors.blue,
              icon: Icons.archive,
              onTap: () => {},
            ),
            IconSlideAction(
              caption: 'Share',
              color: Colors.indigo,
              icon: Icons.share,
              onTap: () => {},
            ),
          ],
          secondaryActions: <Widget>[
            IconSlideAction(
              caption: 'Presa in carico',
              color: Colors.black45,
              icon: Icons.more_horiz,
              onTap: () => {},
            ),
            IconSlideAction(
              caption: 'Delete',
              color: Colors.red,
              icon: Icons.delete,
              onTap: () => {},
            ),
          ],
        );
      });
}
