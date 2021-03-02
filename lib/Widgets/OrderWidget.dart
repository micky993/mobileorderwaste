import 'package:flutter/material.dart';

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
  Future<Orders> myOrders;
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Padding(
      padding: EdgeInsets.all(10),
      child: FutureBuilder<List<Result>>(
          future: getOrders(context),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            return (snapshot.hasData)
                ? builderSnap(context, snapshot)
                : Container();
          }),
    ));
  }
}

Future<List<Result>> getOrders(BuildContext context) async {
  //buildShowDialog(context);
  String pathUri = GlobalDataModel.getValueMap('order');
  var uri = Uri.https(GlobalDataModel.getValueMap('host'), pathUri);
  // ignore: unused_local_variable
  LoginUSer loginData = LoginUSer.getLogonData();
  var response = await GetService.getCall(uri, logonData.user, logonData.pwd);
  // .whenComplete(() => Navigator.of(context).pop());
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
  //Orders myOrder = snapshot.data;
  List<Result> res = snapshot.data;
  //Navigator.of(context).pop();
  return ListView.builder(
      itemCount: res.length,
      itemBuilder: (context, index) {
        var item = res[index];
        return Card(
          elevation: 10,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          child: ListTile(
            title: Row(
              children: <Widget>[
                Text(
                  'WdO: ',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text('${zeroDelete(item.orderNr)}'),
              ],
            ),
            subtitle: buildSubTitle(item, context),
            onTap: () => {},
            isThreeLine: true,
          ),
        );
      });
}

Widget buildSubTitle(Result item, BuildContext context) {
  double c_width = MediaQuery.of(context).size.width * 0.8;
  return Container(
    padding: EdgeInsets.all(5.0),
    width: c_width,
    child: Column(
      children: [
        Padding(
          padding: EdgeInsets.all(5),
          child: Row(
            children: [
              Text('Data: ', style: TextStyle(fontWeight: FontWeight.bold)),
              Text('${dateFromatter(item.orderDate)}'),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.all(5),
          child: Row(
            children: [
              Text('Itinerario: ',
                  style: TextStyle(fontWeight: FontWeight.bold)),
              Text('${item.route}'),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.all(5),
          child: Row(
            children: [
              Text('Impianto/MMA:  ',
                  style: TextStyle(fontWeight: FontWeight.bold)),
              Flexible(
                child: Text(
                  '${item.wdPlantDesc}',
                  //overflow: TextOverflow.ellipsis,
                ),
              )
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.all(5),
          child: Row(
            children: [
              Text('Testo:  ', style: TextStyle(fontWeight: FontWeight.bold)),
              Flexible(
                child: Text(
                  '${item.orderText}',
                  overflow: TextOverflow.ellipsis,
                ),
              )
            ],
          ),
        ),
      ],
    ),
  );
}
