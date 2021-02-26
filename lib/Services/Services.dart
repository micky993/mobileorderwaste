import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'package:mobileorderwaste/Models/GlobalModel.dart';

class GetService {
  static String basicAuthenticationHeader(String username, String password) {
    return 'Basic ' + base64Encode(utf8.encode('$username:$password'));
  }

  static String token;
  static String cookie;

  static String getToken() {
    return (token == null) ? 'fetch' : token;
  }

  static String getCookie() {
    return (cookie != null) ? cookie : '';
  }

  static void getMetadata(String username, String password) async {
    Uri uri = Uri.https(GlobalDataModel.getValueMap('host'),
        GlobalDataModel.getValueMap('metadata'));
    Response response = await http.get(uri, headers: {
      'content-type': 'application/json',
      'accept': 'application/json',
      'Connection': 'keep-alive',
      'x-csrf-token': 'fetch',
      'authorization': basicAuthenticationHeader(username, password),
    });
    List<String> list1 = response.headers['set-cookie'].toString().split(';');
    var datl = list1.firstWhere((a) => a.contains('SAP_SESSIONID'));
    List<String> sessionid = datl.split(",").toList();
    cookie = sessionid.firstWhere((o) => o.startsWith('SAP_SESSIONID'));
    //cookie = response.headers['set-cookie'].toString();
    token = response.headers['x-csrf-token'].toString();
  }

  static Future<Response> getCallLogon(
      Uri uri, String username, String password) async {
    Response response = await http.get(uri, headers: {
      'content-type': 'application/json',
      'accept': 'application/json',
      'Connection': 'keep-alive',
      'authorization': basicAuthenticationHeader(username, password),
    });
    return response;
  }

  static Future<Response> getCall(
      Uri uri, String username, String password) async {
    Response response = await http.get(uri, headers: {
      'content-type': 'application/json',
      'accept': 'application/json',
      'Connection': 'keep-alive',
      'X-Requested-With': 'X',
      'authorization': basicAuthenticationHeader(username, password),
    });
    return response;
  }

  static Future<Response> putCall(
      Uri uri, String username, String password, String json) async {
    Response response = await http.put(uri,
        headers: {
          HttpHeaders.contentTypeHeader: 'application/json',
          HttpHeaders.acceptHeader: 'application/json',
          HttpHeaders.setCookieHeader: getCookie(),
          HttpHeaders.connectionHeader: 'keep-alive',
          'X-Requested-With': 'X',
          'x-csrf-token': getToken(),
          HttpHeaders.cookieHeader: getCookie(),
          HttpHeaders.authorizationHeader:
              basicAuthenticationHeader(username, password)
        },
        body: json);
    return response;
  }

  static Future<Response> postCall(
      Uri uri, String username, String password, String json) async {
    Response response = await http.post(uri,
        headers: {
          HttpHeaders.contentTypeHeader: 'application/json',
          HttpHeaders.acceptHeader: 'application/json',
          HttpHeaders.setCookieHeader: getCookie(),
          HttpHeaders.connectionHeader: 'keep-alive',
          'X-Requested-With': 'X',
          'x-csrf-token': getToken(),
          HttpHeaders.authorizationHeader:
              basicAuthenticationHeader(username, password)
        },
        body: json);
    return response;
  }
}
