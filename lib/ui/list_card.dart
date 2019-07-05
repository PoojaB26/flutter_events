import 'package:flutter/material.dart';
import 'package:flutter_events/model/event_model.dart';

class EventCard extends StatelessWidget {

  final Event event;
  EventCard({this.event});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      child: Card(child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text('Event: ${event.eventName}'),
      )),
    );
  }
}
