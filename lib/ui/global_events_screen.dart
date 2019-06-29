import 'package:flutter/material.dart';
import 'package:flutter_events/ui/event_card.dart';

class GlobalEventsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(

          itemCount: 4,
          itemBuilder: (context, index) => EventCard()),
    );
  }
}