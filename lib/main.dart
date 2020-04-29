import 'package:flutter/material.dart';
import './pages.dart/home_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "COVID-19 HELP",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        indicatorColor: Colors.black,
        primaryColor: Color(0xff222B45),
        fontFamily: "BalooTamma",
      ),
      home: HomePage(),
    );
  }
}