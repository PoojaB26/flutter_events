

import 'dart:_http';

import 'package:flutter_events/model/events_model.dart';
import 'package:http/http.dart' as http;

Future<List<Event>> getEventsList() async{

  String url = "https://flutterevents.com/feed";

  final response = await http.get(url,
    headers: {
      HttpHeaders.contentTypeHeader : 'application/json',
    },
  );
  print(response.statusCode.toString() + "-fluttervents");
  return eventsFromJson(response.body);
}