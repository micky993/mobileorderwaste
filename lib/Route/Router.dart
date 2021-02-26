import 'package:flutter/material.dart';
import 'package:mobileorderwaste/Pages/LoginPage.dart';
import 'package:mobileorderwaste/Pages/VehiclePage.dart';
import 'package:mobileorderwaste/Pages/OrderPage.dart';

abstract class RouterNav {
  static Route<dynamic> generateRoute(
      BuildContext context, RouteSettings settings) {
    switch (settings.name) {
      case LoginPage.routeName:
        return MaterialPageRoute(
            builder: (context) => LoginPage(
                  title: "Login",
                ),
            settings: settings);
        break;

      case VehiclePage.routeName:
        return MaterialPageRoute(
            builder: (context) => VehiclePage(), settings: settings);
        break;

      case OrderPage.routeName:
        return MaterialPageRoute(
            builder: (context) => OrderPage(), settings: settings);
        break;
      default:
        return MaterialPageRoute(
            builder: (context) => LoginPage(
                  title: "Login",
                ),
            settings: settings);
        break;
    }
  }
}
