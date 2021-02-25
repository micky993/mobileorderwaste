class GlobalDataModel {
  static final Map<String, String> config = {
    "host": "amafesplay.amaroma.it:8443",
    "metadata": "/sap/opu/odata/WATP/MOW_SRV/",
    "logon": "/sap/opu/odata/WATP/MOW_SRV/Logons('42')",
    "logonW": "/sap/opu/odata/WATP/MOW_SRV/Logons('42')",
    "vehicle": "/sap/opu/odata/WATP/MOW_SRV/Vehicles"
  };

  static Map getMap() {
    return config;
  }

  static String getValueMap(String key) {
    String mykey = config[key].toString();
    return mykey;
  }
}
