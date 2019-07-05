
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_events/model/event_model.dart';

class FirestoreDatabase{

  getLocalEvents(){
    return Firestore.instance.collection('LocalEvents').snapshots();
  }

  storeNewEvent(Event event, context){
    Firestore.instance.collection('LocalEvents').add({
      'eventName' : event.eventName,
      'city' : event.city,
    }).then((value){
      print('Success');
    }).catchError((error){
     print(error);
    });
  }

}