import 'package:flutter/material.dart';
import 'package:flutter_events/model/event_model.dart';
import 'package:flutter_events/services/api_services.dart';

class GlobalEventsScreen extends StatelessWidget {

  ApiResponse api = new ApiResponse();
  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder<List<Event>>(
        future: api.getEvents(),
        builder: (context, snapshot){

          if(snapshot.hasData){
            return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (context, index)
                => EventCard(event : snapshot.data[index]));
          }

          else{
            return CircularProgressIndicator();
          }
        },
      ),
    );
  }
}


class EventCard extends StatelessWidget {

  final Event event;
  EventCard({@required this.event});


  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(event.eventName),
    );
  }
}
