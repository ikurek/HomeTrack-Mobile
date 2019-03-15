import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

import 'package:home_track/core/core_page.dart';
import 'package:home_track/ui/current/current_page_builder.dart';

class CurrentPage extends StatefulWidget
    implements CorePage<CurrentPageBuilder> {
  CurrentPage({Key key}) : super(key: key);

  @override
  _CurrentPageState createState() => _CurrentPageState();

  @override
  get builder => CurrentPageBuilder();
}

class _CurrentPageState extends State<CurrentPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: widget.builder.buildRootLayout(context));
  }
}
