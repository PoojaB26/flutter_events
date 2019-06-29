import 'package:flutter/material.dart';

class EventCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Card(child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text('Hello'),
      )),
    );
  }
}
