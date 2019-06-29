import 'package:flutter/material.dart';
import 'package:flutter_events/model/events_model.dart';

class EventCard extends StatelessWidget {

  final Event event;
  EventCard({this.event});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Card(child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text('${event.eventName}'),
      )),
    );
  }
}
