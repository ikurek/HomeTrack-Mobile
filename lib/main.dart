import 'package:flutter/material.dart';
import 'package:home_track/ui/home/home_page.dart';

void main() => runApp(MyApp());

const String appTitle = 'HomeTrack';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: appTitle,
      theme: _buildDarkTheme(),
      home: HomePage(),
    );
  }

  ThemeData _buildDarkTheme() {
    return ThemeData(
      brightness: Brightness.dark,
        accentColor: Colors.white
    );
  }
}
