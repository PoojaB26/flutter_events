import 'package:flutter/material.dart';
import 'package:flutter_events/global_events_screen.dart';
import 'package:flutter_events/local_events_screen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            tabs: [Tab(text: 'Upcoming'), Tab(text: 'Local')],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            GlobalEventsScreen(),
            LocalEventsScreen()
          ],
        ),
      ),
    );
  }
}
