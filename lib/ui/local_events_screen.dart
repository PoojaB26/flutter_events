import 'package:flutter/material.dart';
import 'package:flutter_events/ui/event_card.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalEventsScreen extends StatefulWidget {
  @override
  _LocalEventsScreenState createState() => _LocalEventsScreenState();
}

class _LocalEventsScreenState extends State<LocalEventsScreen> {
  String selectedCity = 'Bangalore';
  TextEditingController _cityController;

  @override
  initState(){
    super.initState();
    _getSelectedCity();
  }
  _getSelectedCity() async{
    SharedPreferences prefs1 = await SharedPreferences.getInstance();
    if(selectedCity.compareTo(prefs1.getString('city'))!=0) {
      setState(() {
        selectedCity = prefs1.getString('city') ;
        _cityController = new TextEditingController(text: "$selectedCity");
      });

    }
    else
      _cityController = new TextEditingController(text: "Bangalore");
  }
  _changeCity(String newCity) async {
    SharedPreferences prefs1 = await SharedPreferences.getInstance();
    await prefs1.setString('city', selectedCity);
  }


  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
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
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('You are in $selectedCity?'),
          ),
        ),
        Expanded(
          child: Container(
            child: ListView.builder(

                itemCount: 4,
                itemBuilder: (context, index) => Container(
                  child: Text('Hello $index'),
                )),
          ),
        ),
      ],
    );
  }
}
