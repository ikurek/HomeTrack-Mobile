import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

import 'package:home_track/ui/current/current_page.dart';
import 'package:home_track/ui/home/home_page_builder.dart';

List<Widget> buildListOfTabs() {
  return [CurrentPage(), CurrentPage(), CurrentPage()];
}
