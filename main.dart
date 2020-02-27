import 'package:flutter/material.dart';
import 'widget.dart';
import 'home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'First App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        body:Login(),
      ),
      routes: {
        '/home':(content) => Home(),
      },
    );
  }
}