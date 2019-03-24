import 'package:flutter/material.dart';
import 'first_page.dart';
import 'package:flutter/services.dart';

void main() async {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.white
  ));

  /*SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    systemNavigationBarColor: Colors.blue,
    statusBarColor: Colors.pink,
  ));*/
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Avengers Endgame',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: FirstPage()
    );
  }
}

