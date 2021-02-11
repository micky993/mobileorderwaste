import 'package:flutter/material.dart';
import 'package:mobileorderwaste/Services/Services.dart';
import 'package:mobileorderwaste/Models/GlobalModel.dart';
import 'package:mobileorderwaste/Models/UserModel.dart';

class VeichleWidget extends StatefulWidget {
  VeichleWidget({Key key}) : super(key: key);

  @override
  _VeichleWidgetState createState() => _VeichleWidgetState();
}

class _VeichleWidgetState extends State<VeichleWidget> {
  String roleValue;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          DropdownButton<String>(
            value: roleValue,
            items: [
              DropdownMenuItem(
                value: '01',
                child: Text('Driver'),
              ),
              DropdownMenuItem(
                value: '02',
                child: Text('Loader'),
              )
            ],
            onChanged: (value) {
              getVehicle(value);
              setState(() => {roleValue = value});
            },
          )
        ],
      ),
    );
  }

  void getVehicle(String role) async {
    if (role == '01') {
      String pathUri = GlobalDataModel.getValueMap('logon');
      var uri = Uri.https(GlobalDataModel.getValueMap('host'), pathUri);
      print(uri);
      final response =
          await GetService.getCall(uri, logonData.usr, logonData.pwd);
    }
  }
}
