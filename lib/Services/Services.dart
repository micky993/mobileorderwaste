import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;

class GetService {
  static String basicAuthenticationHeader(String username, String password) {
    return 'Basic ' + base64Encode(utf8.encode('$username:$password'));
  }

  static String getToken() {
    return (token == null) ? 'fetch' : token;
  }

  static String getCookie() {
    return (cookie != null) ? cookie : '';
  }

  static void getDataCall(String username, String password, Uri uri) async {
    Response response = await http.get(uri, headers: {
      'content-type': 'application/json',
      'accept': 'application/json',
      'Connection': 'keep-alive',
      'x-csrf-token': 'fetch',
      'authorization': basicAuthenticationHeader(username, password),
    });
    cookie = response.headers['set-cookie'].toString();
  }

  static String token;
  static String cookie;
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
          HttpHeaders.authorizationHeader:
              basicAuthenticationHeader(username, password)
        },
        body: json);
    return response;
  }
}
