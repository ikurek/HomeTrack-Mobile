import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:home_track/core/core_page.dart';

import 'home_page_builder.dart';
import 'home_page_service.dart';

class HomePage extends StatefulWidget implements CorePage<HomePageBuilder> {
  HomePage({Key key, this.title}) : super(key: key);
  final String title;
  final List<Widget> tabs = buildListOfTabs();

  @override
  _HomePageState createState() => _HomePageState();

  @override
  get builder => HomePageBuilder();
}

class _HomePageState extends State<HomePage> {
  int currentTabSelected = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: widget.builder.buildHomePageAppBar(widget.title),
      body: widget.tabs[currentTabSelected],
      bottomNavigationBar: widget.builder.buildHomePageBottomNavigationBar(
          context, currentTabSelected, _onTabSelected),
    );
  }

  void _onTabSelected(int tab) {
    setState(() {
      currentTabSelected = tab;
    });
    debugPrint('Selected tab: $currentTabSelected');
  }
}
