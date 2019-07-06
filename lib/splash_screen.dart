import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_events/home_screen.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  initState(){
    loadTimer();
    super.initState();

  }

  Future<Timer> loadTimer() async {
    return Timer(Duration(seconds: 6), navigate);
  }


  navigate() {
    Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (_) => HomeScreen()
    ));
  }

    @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple,
      body: Container(
          padding: EdgeInsets.all(20),
          alignment: Alignment.center,
          child: Image.network('https://itsallwidgets.com/images/logo.png')),
    );
  }
}
