import 'package:flutter/material.dart';

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
            Container(),
            Container()
          ],
        ),
      ),
    );
  }
}
