

import 'package:flutter_events/model/event_model.dart';
import 'package:http/http.dart' as http;

class ApiResponse{

  String url = 'https://flutterevents.com/feed';

  Future<List<Event>> getEvents() async {
      final response = await http.get(url);
      return eventFromJson(response.body);
  }
}