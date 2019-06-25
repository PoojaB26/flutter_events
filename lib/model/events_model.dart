// To parse this JSON data, do
//
//     final events = eventsFromJson(jsonString);

import 'dart:convert';

List<Events> eventsFromJson(String str) => new List<Events>.from(json.decode(str).map((x) => Events.fromJson(x)));

String eventsToJson(List<Events> data) => json.encode(new List<dynamic>.from(data.map((x) => x.toJson())));

class Events {
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

  Events({
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

  factory Events.fromJson(Map<String, dynamic> json) => new Events(
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
