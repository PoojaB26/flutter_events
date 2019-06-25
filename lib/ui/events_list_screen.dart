import 'package:flutter/material.dart';
import 'package:flutter_events/api_services.dart';
import 'package:flutter_events/model/events_model.dart';
import 'package:flutter_events/ui/event_card.dart';

class EventListScreen extends StatefulWidget {

//  final List<Event> events;
//  EventListScreen({this.events});
  @override
  _EventListScreenState createState() => _EventListScreenState();
}

class _EventListScreenState extends State<EventListScreen> with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder(
        future: getEventsList(),
        builder: (context, snapshot){
          if(snapshot.hasData){
            print(snapshot.data.length);
            return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (context, index){
                  return EventCard(
                    event: snapshot.data[index],
                  );
                });
          }
          else return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
