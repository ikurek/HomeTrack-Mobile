import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

import 'package:home_track/core/core_builder.dart';
import 'package:home_track/ui/home/home_page_builder.dart';

class HomePageBuilder extends CoreBuilder {
  @override
  Widget buildRootLayout(BuildContext context) {
    return null;
  }

  Widget buildHomePageAppBar(String title) {
    return AppBar(title: Text(title));
  }
}
