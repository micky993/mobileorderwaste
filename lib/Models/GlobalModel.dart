class GlobalDataModel {
  static final Map<String, String> config = {
    "host": "amafesplay.amaroma.it:8443",
    "logon": "/sap/opu/odata/WATP/MOW_SRV/Logons('42')",
    "veichle": "/sap/opu/odata/WATP/MOW_SRV/Veichle"
  };

  static Map getMap() {
    return config;
  }

  static String getValueMap(String key) {
    String mykey = config[key].toString();
    return mykey;
  }
}
