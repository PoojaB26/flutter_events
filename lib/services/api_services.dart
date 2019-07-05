
import 'package:flutter_events/model/event_model.dart';
import 'package:http/http.dart' as http;

class ApiResponse{

  Future<List<Event>> getEvents() async {

    String url = 'https://flutterevents.com/feed';

    final response = await http.get(url);
    return eventFromJson(response.body);

  }

}