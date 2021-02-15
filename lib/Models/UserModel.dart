class Utente {
  String username;
  String password;
}

LoginUSer logonData;
logonDataSet(String username, String password) =>
    LoginUSer.setLogonData(username, password);

LoginUSer logonDataGet(String username, String password) =>
    LoginUSer.getLogonData();

class LoginUSer {
  String user;
  String pwd;

  static void setLogonData(String username, String password) {
    logonData = new LoginUSer();
    logonData.user = username;
    logonData.pwd = password;
  }

  static LoginUSer getLogonData() {
    return logonData;
  }
}
