import 'dart:collection';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/services.dart';

class GlobalDataModel {
  final List list = new List();
  HashMap globalData = new HashMap<String, String>();

  static void setHasMapValue() async {
    HashMap map = new HashMap<String, String>();
    String route = await rootBundle
        .loadString('mobileorderwaste/Assets/TextAssets/RouteOdata');
    map = (LineSplitter().convert(route) as Map).map(() => {});
  }
}
