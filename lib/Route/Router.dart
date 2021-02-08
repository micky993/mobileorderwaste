import 'package:flutter/material.dart';
import 'package:mobileorderwaste/Pages/LoginPage.dart';

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

      //case Page1Screen.routeName:
      //  return MaterialPageRoute<String>(
      //      builder: (context) => Page1Screen(), settings: settings);
      //  break;

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
