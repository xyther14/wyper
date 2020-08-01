import 'package:flutter/material.dart';
import 'package:wypernew/screens/main-page.dart';

void main() {
  runApp(WyperApp());
}

class WyperApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        primaryColor: Colors.black,
        scaffoldBackgroundColor: Colors.black,
      ),
      home: MainPage(),
    );
  }
}




