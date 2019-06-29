import 'package:flutter/material.dart';
import 'package:flutter_events/model/events_model.dart';
import 'package:flutter_events/services/api_services.dart';
import 'package:flutter_events/ui/event_card.dart';

class GlobalEventsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder<List<Event>>(
        future: getEventsList(),
        builder: (context, snapshot) {
          if(snapshot.hasData){
            return ListView.builder(

                itemCount: snapshot.data.length,
                itemBuilder: (context, index) => EventCard(
                  event: snapshot.data[index],
                ));

          }
          else return Center(child: CircularProgressIndicator());
        }
      ),
    );
  }
}
