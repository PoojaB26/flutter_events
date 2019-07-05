import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_events/ui/list_card.dart';
import 'package:flutter_events/model/event_model.dart';
import 'package:flutter_events/services/api_services.dart';
import 'package:flutter_events/services/firebase_services.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalEventsScreen extends StatefulWidget {

  final List<Event> events;
  LocalEventsScreen({this.events});

  @override
  _LocalEventsScreenState createState() => _LocalEventsScreenState();
}

class _LocalEventsScreenState extends State<LocalEventsScreen> {
  final FirestoreDatabase firestoreDatabase = new FirestoreDatabase();

  SharedPreferences sharedPreferences;
  String selectedCity = 'Bangalore';
  @override
  void initState() {
    initSharedPrefs();
    super.initState();
  }

  initSharedPrefs() async {
    sharedPreferences = await SharedPreferences.getInstance();
    getSelectedCity();
  }

  getSelectedCity() async {
    if(sharedPreferences!=null && sharedPreferences.containsKey('city')) {
      String storedCity = sharedPreferences.getString('city');
      setState(() {
        if (storedCity.compareTo(selectedCity) != 0) {
          selectedCity = storedCity;
          cityController = new TextEditingController(text: selectedCity);
        }
      });
    }
    else cityController =
    new TextEditingController(text: 'Bangalore'); //default
  }

  changeCity(String newCity) async {
    await sharedPreferences.setString('city', newCity);
  }

  @override
  Widget build(BuildContext context) {

    Widget firestoreList = StreamBuilder<QuerySnapshot>(
      stream: firestoreDatabase.getLocalEvents(),
      builder: (context, snapshot){
        if(snapshot.hasData){

          var newList = snapshot.data.documents.map((event) {
            return Event.fromSnapshot(event);
          }).toList();

          return ListView.builder(
              itemCount: newList.length,
              itemBuilder: (context, index) =>
                  EventCard(
                      event: newList[index]
                  ));
        }

        else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );


    Widget currentCity = Padding(
      padding: EdgeInsets.all(10),
      child: GestureDetector(
        onTap: () => openDialogWidget(),
        child: Row(
          children: <Widget>[
            Text('You are in $selectedCity'),
          ],
        ),
      ),
    );


    return Column(
      children: <Widget>[
        currentCity,
        Expanded(child: firestoreList),

      ],
    );
  }

  TextEditingController cityController;
  openDialogWidget() {
    showDialog(context: context,
    builder: (context){
      return AlertDialog(
        content: Container(
          height: 150,
          child: Column(
            children: <Widget>[
              Text('Select City'),
              TextFormField(
                controller: cityController,
              ),
              RaisedButton(
                onPressed: () => onDialogButtonClicked(),
                child: Text('OK'),
              )
            ],
          ),
        ),
      );
    }
    );
  }

  onDialogButtonClicked() {
    if(cityController.toString().isNotEmpty){
      setState(() {
        selectedCity = cityController.text.toString();
        changeCity(selectedCity);
      });
    }
    Navigator.of(context).pop();
  }
}
