import 'package:flutter/material.dart';
import 'package:flutter_events/model/events_model.dart';

class EventCard extends StatelessWidget {

  final Event event;
  EventCard({this.event});

  @override
  Widget build(BuildContext context) {
    print('event : ${event.city}');
    return Container(
      margin: EdgeInsets.all(10.0),
      child: Card(child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text('${event.city}'),
      )),
    );
  }
}
