import 'package:flutter/material.dart';
import 'package:mobileorderwaste/Pages/LoginPage.dart';
import 'package:mobileorderwaste/Route/Router.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mobile Order Waste',
      theme: ThemeData(
        primarySwatch: Colors.red,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: LoginPage.routeName,
      onGenerateRoute: (settings) => RouterNav.generateRoute(context, settings),
    );
  }
}
