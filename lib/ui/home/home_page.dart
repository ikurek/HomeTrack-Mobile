import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:home_track/core/core_page.dart';
import 'package:home_track/ui/current/current_page.dart';
import 'package:home_track/ui/today/today_page.dart';

import 'home_page_builder.dart';
import 'home_page_service.dart';

class HomePage extends StatefulWidget
    implements CorePage<HomePageBuilder, HomePageService> {
  HomePage({Key key}) : super(key: key);
  final List<Widget> tabViews = [CurrentPage(), TodayPage(), CurrentPage()];
  final List<String> tabTitles = ["Current", "Today", "Statistics"];
  final List<Widget> tabButtons = [
    Tab(icon: Icon(Icons.adjust), text: "Current",),
    Tab(icon: Icon(Icons.today), text: "Today",),
    Tab(icon: Icon(Icons.data_usage), text: "Statistics",)
  ];

  @override
  _HomePageState createState() => _HomePageState();

  @override
  get builder => HomePageBuilder();

  @override
  get service => HomePageService();
}

class _HomePageState extends State<HomePage>
    with TickerProviderStateMixin, AutomaticKeepAliveClientMixin<HomePage> {
  int _currentTabSelected = 0;
  TabController _tabController;

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    _tabController = TabController(
        initialIndex: 0, length: widget.tabButtons.length, vsync: this);
    _tabController.addListener(() => _onTabChanged());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      appBar: widget.builder
          .buildHomePageAppBar(widget.tabTitles[_currentTabSelected]),
      body: TabBarView(controller: _tabController, children: widget.tabViews),
      bottomNavigationBar: TabBar(
          controller: _tabController, tabs: widget.tabButtons),
    );
  }

  void _onTabChanged() {
    setState(() {
      _currentTabSelected = _tabController.index;
    });
    debugPrint('Selected tab: $_currentTabSelected');
  }
}
