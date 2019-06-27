import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_events/model/events_model.dart';
import 'package:flutter_events/services/firebase_methods.dart';
import 'package:flutter_events/ui/event_card.dart';

class FavouriteScreen extends StatelessWidget {

  FirestoreDatabase firestoreDatabase = new FirestoreDatabase();

  Widget build(BuildContext context) {
    return Container(
      child: StreamBuilder<QuerySnapshot>(
        stream: firestoreDatabase.getLocalEvents(),
        builder: (context, snapshot) {
          if(snapshot.hasData){

            var newData = snapshot.data.documents.map((snapshot) {
              return Event.fromSnapshot(snapshot);
            }).toList();

            print(newData);

            return ListView.builder(
                itemCount: newData.length,
                itemBuilder: (context, index){
                  print(newData.length);
                  return EventCard(
                    event: newData[index],
                  );
                });
          }
          else return CircularProgressIndicator();
        }
      ),
    );
  }
}
