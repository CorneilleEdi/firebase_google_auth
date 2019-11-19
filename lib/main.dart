import 'package:firebase_google_auth/route_generator.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Google Sign In',

      theme: ThemeData(
        primarySwatch: Colors.blue,
        primaryColor: Color(0XFF6D3FFF),
        accentColor: Color(0XFF233C63),
        brightness: Brightness.dark,
        fontFamily: 'RobotoMono',
        buttonTheme: ButtonThemeData(),
      ),

      initialRoute: '/',
      onGenerateRoute: RouteGenerator.generateRoute,


    );
  }
}
