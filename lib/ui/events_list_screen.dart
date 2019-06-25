import 'package:flutter/material.dart';
import 'package:flutter_events/api_services.dart';
import 'package:flutter_events/model/events_model.dart';


class EventsListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: FutureBuilder<List<Events>>(
          future: getEventsList(),
          builder: (context, snapshot){
            return Text('${snapshot.data[0].address}');
          },
        ),
      ),
    );
  }
}
