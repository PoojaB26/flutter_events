import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_events/model/events_model.dart';
import 'package:flutter_events/services/firebase_methods.dart';
import 'package:flutter_events/ui/event_card.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalEventsScreen extends StatefulWidget {

  @override
  _LocalEventsScreenState createState() => _LocalEventsScreenState();
}

class _LocalEventsScreenState extends State<LocalEventsScreen> {

  String selectedCity = 'Bangalore';
  TextEditingController _cityController;


  FirestoreDatabase firestoreDatabase = new FirestoreDatabase();

  @override
  initState(){
    super.initState();
    _getSelectedCity();
  }
  _getSelectedCity() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if(selectedCity.compareTo(prefs.getString('city'))!=0) {
      print(selectedCity);
      print(prefs.getString('city'));
      setState(() {
        selectedCity = prefs.getString('city') ;
        _cityController = new TextEditingController(text: "$selectedCity");
      });

    }
    else
      _cityController = new TextEditingController(text: "Bangalore");
  }
  _changeCity(String newCity) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('city', selectedCity);
  }

  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();

    return Column(
      children: <Widget>[
        GestureDetector(
          onTap: (){
            showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    content: Form(
                      key: _formKey,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text('Change City'),
                          ),
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: TextFormField(
                              controller: _cityController,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: RaisedButton(
                              child: Text("Submit"),
                              onPressed: () {
                                if (_cityController.toString().isNotEmpty) {
                                  setState(() {
                                    selectedCity = _cityController.text.toString();
                                    print(selectedCity);
                                    _changeCity(selectedCity);
                                    Navigator.pop(context);
                                  });
                                }
                              },
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                });
          },
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
            alignment: Alignment.centerLeft,
            child: Row(
              children: <Widget>[
                Text('You are in $selectedCity'),
                Icon(Icons.keyboard_arrow_down, size: 20,)
              ],
            ),
          ),
        ),
        Expanded(
          child: Container(
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
                else return Center(child: CircularProgressIndicator());
              }
            ),
          ),
        ),
      ],
    );
  }
}
