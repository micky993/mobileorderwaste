import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mobileorderwaste/Models/LoginModel.dart';
import 'package:mobileorderwaste/Models/UserModel.dart';
import 'package:mobileorderwaste/Styles/GlobalStyles.dart';
import 'package:mobileorderwaste/Utils/Utils.dart';
import 'package:mobileorderwaste/Services/Services.dart';
import 'package:mobileorderwaste/Models/GlobalModel.dart';
import 'package:mobileorderwaste/Pages/VehiclePage.dart';

class FormLoginW extends StatefulWidget {
  FormLoginW({Key key}) : super(key: key);

  @override
  _FormLoginWState createState() => _FormLoginWState();
}

class _FormLoginWState extends State<FormLoginW> {
  GlobalTextInput textStyle = GlobalTextInput();
  bool isLoginDisabled = true;
  Utente utente = new Utente();
  TextEditingController usrController = TextEditingController();
  TextEditingController pswController = TextEditingController();

  @override
  void initState() {
    super.initState();
    usrController.text = '';
    pswController.text = '';
    usrController.addListener(formOnChanged);
    usrController.addListener(removeSomeChar);
    pswController.addListener(formOnChanged);
  }

  @override
  void dispose() {
    usrController.dispose();
    pswController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(16),
            child: TextField(
              decoration: textStyle.inputDeco('Username'),
              controller: usrController,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(16),
            child: TextField(
              obscureText: true,
              decoration: textStyle.inputDeco("Password"),
              controller: pswController,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(16),
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                child: Text('Login'),
                onPressed: isLoginDisabled ? null : _loginPressed,
                style: textStyle.btnStyle(),
              ),
            ),
          )
        ],
      ),
    );
  }

  void _loginPressed() {
    setState(() {
      utente.username = usrController.text;
      utente.password = pswController.text;
    });
    getLogon();
    //List<Loginres> lista =
  }

  void formOnChanged() {
    setState(() {
      isLoginDisabled =
          (usrController.text.length == 0 || pswController.text.length == 0);
    });
  }

  void removeSomeChar() {
    final text = usrController.text
        .toLowerCase()
        .replaceAll("@", "")
        .replaceAll("#", "");

    usrController.value = usrController.value.copyWith(
      text: text,
      selection:
          TextSelection(baseOffset: text.length, extentOffset: text.length),
      composing: TextRange.empty,
    );
  }

  void getLogon() async {
    String pathUri = GlobalDataModel.getValueMap('logon');
    var uri = Uri.https(GlobalDataModel.getValueMap('host'), pathUri);
    final response =
        await GetService.getCallLogon(uri, utente.username, utente.password);
    if (response.statusCode == 200) {
      LoginRes loginRes = loginResFromJson(response.body);
      LoginUSer user = LoginUSer();
      user.user = utente.username.toUpperCase();
      user.pwd = utente.password;
      user.fittVehicle = loginRes.d.fittVehicle;
      user.name = loginRes.d.name;
      user.perNr = loginRes.d.perNr;
      user.role = loginRes.d.role;
      user.vehicleId = loginRes.d.vehicleId;
      user.versionId = loginRes.d.versionId;

      logonDataSet(user);
      if (loginRes.d.perNr != null) {
        Scaffold.of(context).showSnackBar(SnackBar(
          content: Text("Login riuscito!"),
        ));
      }
      Navigator.pushNamedAndRemoveUntil(
          context, VehiclePage.routeName, (_) => false,
          arguments: 'Selezione profilo');
    } else {
      analizeStatusCode(context, response.statusCode);
      pswController.text = '';
    }
  }
}
