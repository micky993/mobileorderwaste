class Utente {
  String username;
  String password;
}

LoginUSer logonData;
logonDataSet(LoginUSer userData) => LoginUSer.setLogonData(userData);

LoginUSer logonDataGet(String username, String password) =>
    LoginUSer.getLogonData();

class LoginUSer {
  String user;
  String pwd;
  String fittVehicle;
  String perNr;
  String vehicleId;
  String role;
  String name;
  String versionId;

  static void setLogonData(LoginUSer userData) {
    logonData = new LoginUSer();
    logonData.user = userData.user;
    logonData.pwd = userData.pwd;
    logonData.fittVehicle = userData.fittVehicle;
    logonData.name = userData.name;
    logonData.perNr = userData.perNr;
    logonData.role = userData.role;
    logonData.vehicleId = userData.vehicleId;
    logonData.versionId = userData.versionId;
  }

  static LoginUSer getLogonData() {
    return logonData;
  }
}
