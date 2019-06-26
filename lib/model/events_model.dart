// To parse this JSON data, do
//
//     final events = eventsFromJson(jsonString);

import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

List<Event> eventsFromJson(String str) => new List<Event>.from(json.decode(str).map((x) => Event.fromJson(x)));

String eventsToJson(List<Event> data) => json.encode(new List<dynamic>.from(data.map((x) => x.toJson())));

class Event {
  String eventName;
  String eventUrl;
  DateTime eventDate;
  String address;
  String city;
  double latitude;
  double longitude;
  String textMessage;
  String htmlMessage;
  String description;
  Event.fromSnapshot(DocumentSnapshot snapshot)
      : eventName = snapshot['eventName'],
        city = snapshot['city'];

  Event({
    this.eventName,
    this.eventUrl,
    this.eventDate,
    this.address,
    this.city,
    this.latitude,
    this.longitude,
    this.textMessage,
    this.htmlMessage,
    this.description,
  });

  factory Event.fromJson(Map<String, dynamic> json) => new Event(
    eventName: json["event_name"],
    eventUrl: json["event_url"],
    eventDate: DateTime.parse(json["event_date"]),
    address: json["address"],
    city: json["city"],
    latitude: json["latitude"].toDouble(),
    longitude: json["longitude"].toDouble(),
    textMessage: json["text_message"],
    htmlMessage: json["html_message"],
    description: json["description"] == null ? null : json["description"],
  );

//   Event.fromSnapshot(DocumentSnapshot snapshot) :
//
//  Record.fromMap(Map<String, dynamic> map, {this.reference})
//      : assert(map['name'] != null),
//        assert(map['votes'] != null),
//        name = map['name'],
//        votes = map['votes'];
//
//  Record.fromSnapshot(DocumentSnapshot snapshot)
//      : this.fromMap(snapshot.data, reference: snapshot.reference);


  Map<String, dynamic> toJson() => {
    "event_name": eventName,
    "event_url": eventUrl,
    "event_date": "${eventDate.year.toString().padLeft(4, '0')}-${eventDate.month.toString().padLeft(2, '0')}-${eventDate.day.toString().padLeft(2, '0')}",
    "address": address,
    "city": city,
    "latitude": latitude,
    "longitude": longitude,
    "text_message": textMessage,
    "html_message": htmlMessage,
    "description": description == null ? null : description,
  };
}
