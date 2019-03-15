import 'package:flutter/material.dart';
import 'home/home_page.dart';

void main() => runApp(MyApp());

const String appTitle = 'HomeTrack';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: appTitle,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(title: appTitle),
    );
  }
}