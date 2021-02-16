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
  String equipment;
  Future<VehicleRes> myItemsLoop;
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
                  myItemsLoop = getVehicle(value);
                },
              ),
            ),
          ),
          Padding(
              padding: EdgeInsets.all(20),
              child: SizedBox(
                width: double.infinity,
                child: FutureBuilder<VehicleRes>(
                  future: myItemsLoop,
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    return DropdownButton<String>(
                        isExpanded: true,
                        hint: Text('Mezzo'),
                        value: equipment,
                        items: (snapshot.hasData) ? binding(snapshot) : [],
                        onChanged: (equi) {
                          setState(() => {equipment = equi});
                        });
                  },
                ),
              )),
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
        return vehicleRes;
      } else {
        analizeStatusCode(context, response.statusCode);
      }
    } else {
      myItemsLoop = null;
    }
  }

  List<DropdownMenuItem<String>> binding(AsyncSnapshot snapshot) {
    List<Result> veicoli = List<Result>();
    //for (VehicleRes item in snapshot.data) {
    //  veicoli.add(item);
    //}
    VehicleRes item = snapshot.data;
    veicoli = item.d.results.toList();
    print(veicoli);
    return veicoli.map<DropdownMenuItem<String>>((Result item) {
      return DropdownMenuItem<String>(
        value: item.vehicleId,
        child: Text('${item.fleetVin}'),
      );
    }).toList();
  }
}
