import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:home_track/core/core_page.dart';
import 'package:home_track/ui/today/today_page_builder.dart';
import 'package:home_track/ui/today/today_page_service.dart';

class TodayPage extends StatefulWidget
    implements CorePage<TodayPageBuilder, TodayPageService> {
  TodayPage({Key key}) : super(key: key);

  @override
  _TodayPageState createState() => _TodayPageState();

  @override
  get builder => TodayPageBuilder();

  @override
  get service => TodayPageService();
}

class _TodayPageState extends State<TodayPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: widget.builder.buildRootLayout(context));
  }
}
