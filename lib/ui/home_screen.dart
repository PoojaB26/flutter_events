import 'package:flutter/material.dart';
import 'package:flutter_events/ui/global_events_screen.dart';
import 'package:flutter_events/ui/local_events_screen.dart';


class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
          length: 2,
          child: Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              iconTheme: IconThemeData(
                color: Colors.black, //change your color here
              ),
              backgroundColor: Colors.white,
              bottom: TabBar(
                labelColor: Colors.black,
                labelStyle: TextStyle(fontWeight: FontWeight.w700, fontSize: 18),
                unselectedLabelStyle:
                TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                indicatorColor: Colors.lightBlueAccent,
                tabs: [Tab(text: 'Upcoming'), Tab(text: 'Favorites')],
              ),
            ),
            body: TabBarView(
              children: [
                EventListScreen(),
                FavouriteScreen()
              ],
            ),
          ),
        );

  }
}
