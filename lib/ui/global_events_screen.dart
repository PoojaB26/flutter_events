import 'package:flutter/material.dart';
import 'package:flutter_events/ui/list_card.dart';
import 'package:flutter_events/model/event_model.dart';
import 'package:flutter_events/services/api_services.dart';
import 'package:flutter_events/services/firebase_services.dart';

class GlobalEventsScreen extends StatelessWidget {
  final List<Event> events;
  GlobalEventsScreen({this.events});

  final ApiResponse api = new ApiResponse();
  final FirestoreDatabase firestoreDatabase = new FirestoreDatabase();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Event>>(
      future: api.getEvents(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (context, index) => GestureDetector(
                    onTap: () => firestoreDatabase.storeNewEvent(
                        snapshot.data[index], context),
                    child: EventCard(event: snapshot.data[index]),
                  ));
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
