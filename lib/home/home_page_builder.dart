import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

Widget buildHomePageAppBar(String title) {
  return AppBar(title: Text(title));
}

Widget buildHomePageLayout(BuildContext context) {
  return Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          'You have pushed the button this many times:',
        ),
        Text(
          'AAAAA',
          style: Theme.of(context).textTheme.display1,
        ),
      ],
    ),
  );
}

Widget buildHomePageBottomNavigationBar(BuildContext contex, var startingIndex, var onTabClicked) {
  return BottomNavigationBar(
    onTap: onTabClicked,
    currentIndex: startingIndex,
    items: [
      new BottomNavigationBarItem(
        icon: Icon(Icons.home),
        title: Text('Home'),
      ),
      new BottomNavigationBarItem(
        icon: Icon(Icons.today),
        title: Text('Today'),
      ),
      new BottomNavigationBarItem(
        icon: Icon(Icons.data_usage),
        title: Text('Statistics'),
      )
    ],
  );
}

Widget buildSamplePage(int index) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
      Text('Page $index')
    ],
  );
}
