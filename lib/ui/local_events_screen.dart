import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_events/ui/list_card.dart';
import 'package:flutter_events/model/event_model.dart';
import 'package:flutter_events/services/api_services.dart';
import 'package:flutter_events/services/firebase_services.dart';

class LocalEventsScreen extends StatelessWidget {


  final List<Event> events;
  LocalEventsScreen({this.events});

  final FirestoreDatabase firestoreDatabase = new FirestoreDatabase();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: firestoreDatabase.getLocalEvents(),
      builder: (context, snapshot){
        if(snapshot.hasData){

          var newList = snapshot.data.documents.map((event) {
            return Event.fromSnapshot(event);
          }).toList();

          return ListView.builder(
              itemCount: newList.length,
              itemBuilder: (context, index) =>
                  EventCard(
                      event: newList[index]
                  ));
        }

        else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
