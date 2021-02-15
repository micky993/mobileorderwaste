import 'package:flutter/material.dart';
import 'package:mobileorderwaste/Services/Services.dart';
import 'package:mobileorderwaste/Models/GlobalModel.dart';
import 'package:mobileorderwaste/Models/UserModel.dart';
import 'package:mobileorderwaste/Styles/GlobalStyles.dart';
import 'package:mobileorderwaste/Models/VehicleModel.dart';
import 'package:mobileorderwaste/Utils/Utils.dart';

class VeichleWidget extends StatefulWidget {
  VeichleWidget({Key key}) : super(key: key);

  @override
  _VeichleWidgetState createState() => _VeichleWidgetState();
}

class _VeichleWidgetState extends State<VeichleWidget> {
  String roleValue;
  Result equipment;
  VehicleRes myItemsLoop;
  var list;
  GlobalTextInput textStyle = GlobalTextInput();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(20),
            child: SizedBox(
              width: double.infinity,
              child: DropdownButton<String>(
                value: roleValue,
                isExpanded: true,
                hint: Text("Profilo"),
                //style: TextStyle(),
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
                  setState(() => {roleValue = value});
                  list = getVehicle(value);
                },
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(20),
            child: SizedBox(
              width: double.infinity,
              child: DropdownButton<Result>(
                  isExpanded: true,
                  hint: Text('Mezzo'),
                  value: equipment,
                  items: (list != null) ? binding() : [],
                  onChanged: (value) {
                    setState(() => {equipment = value});
                  }),
            ),
          )
        ],
      ),
    );
  }

  Future<VehicleRes> getVehicle(String role) async {
    if (role == '01') {
      String pathUri = GlobalDataModel.getValueMap('vehicle');
      var uri = Uri.https(GlobalDataModel.getValueMap('host'), pathUri);
      LoginUSer loginData = LoginUSer.getLogonData();
      final response =
          await GetService.getCall(uri, logonData.user, logonData.pwd);
      if (response.statusCode == 200) {
        VehicleRes vehicleRes = vehicleResFromJson(response.body);
        if (vehicleRes.d.results.isEmpty) {
          showAlertDialog(
              context, 'OK', 'Attenzione!', 'Nessun Wdo da prendere in carico');
        }
        myItemsLoop = vehicleRes;
        return vehicleRes;
      } else {
        analizeStatusCode(context, response.statusCode);
      }
    }
  }

  DropdownMenuItem<Result> binding() {
    List<Result> veicoli;
    if (myItemsLoop != null) {
      for (var item in myItemsLoop.d.results) {
        veicoli.add(item);
      }
      veicoli.map<DropdownMenuItem<Result>>((Result item) {
        return DropdownMenuItem<Result>(
          value: item,
          child: Text(''),
        );
      }).toList();
    }
  }
}
