import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

import 'home_page_builder.dart';
import 'package:home_track/current/current_page.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);
  final String title;

   final List<Widget> _children = [
   CurrentPage(),
   buildSamplePage(2),
   buildSamplePage(3)
 ];

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  int currentTabSelected = 0;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildHomePageAppBar(widget.title),
      body: widget._children[currentTabSelected],
      bottomNavigationBar:
          buildHomePageBottomNavigationBar(context, currentTabSelected, _onTabSelected),
    );
  }

  void _onTabSelected(int tab) {
    setState(() {
      currentTabSelected = tab;
    });
    debugPrint('Selected tab: $currentTabSelected');
  }
}
