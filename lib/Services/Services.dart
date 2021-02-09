import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;

class GetService {
  static String basicAuthenticationHeader(String username, String password) {
    return 'Basic ' + base64Encode(utf8.encode('$username:$password'));
  }

  static Future<Response> getCall(
      Uri uri, String username, String password) async {
    Response response = await http.get(uri, headers: {
      'content-type': 'application/json',
      'accept': 'application/json',
      'authorization': basicAuthenticationHeader(username, password)
    });
    return response;
  }
}
