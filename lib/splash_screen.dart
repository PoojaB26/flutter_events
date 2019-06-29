import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_events/home_screen.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    loadTimer();
  }

  Future<Timer> loadTimer() async {
    return new Timer(Duration(seconds: 8), navigate);
  }

  navigate() async {
    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => HomeScreen()));
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple,
      body: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.all(20),
        child: Image.network('https://itsallwidgets.com/images/logo.png'),
      ),
    );
  }

}
