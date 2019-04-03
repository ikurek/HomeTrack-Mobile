import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:home_track/core/core_page.dart';
import 'package:home_track/domain/weather.dart';
import 'package:home_track/ui/current/current_page_builder.dart';
import 'package:home_track/ui/current/current_page_service.dart';

class CurrentPage extends StatefulWidget
    implements CorePage<CurrentPageBuilder, CurrentPageService> {
  CurrentPage({Key key}) : super(key: key);

  @override
  _CurrentPageState createState() => _CurrentPageState();

  @override
  get builder => CurrentPageBuilder();

  @override
  get service => CurrentPageService();
}

class _CurrentPageState extends State<CurrentPage>
    with AutomaticKeepAliveClientMixin<CurrentPage> {
  Weather _weather;
  Error _error;

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    _refresh();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return widget.builder.buildRootLayout(context, _weather, _error, _refresh);
  }

  Future<dynamic> _refresh() async {
    return widget.service.getLatestDateEntry().then((weather) {
      setState(() {
        _weather = weather;
        _error = null;
      });
    }).catchError((error) {
      setState(() {
        _error = error;
      });
    });
  }
}
