import 'package:flutter/material.dart';
import 'package:flutter_events/model/events_model.dart';

class EventCard extends StatefulWidget {

  final Event event;
  EventCard({this.event});

  @override
  _EventCardState createState() => _EventCardState();
}

class _EventCardState extends State<EventCard> {

  @override
  Widget build(BuildContext context) {
    print('event : ${widget.event.city}');
    return Container(
      margin: EdgeInsets.all(10.0),
      child: Card(child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(widget.event.eventName),
            Text(widget.event.city??"")
          ],
        )
      )),
    );
  }
}
