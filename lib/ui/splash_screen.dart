import 'dart:async';

import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {


  @override
  void initState() {
    loadTimer();
    super.initState();
  }

  Future<Timer> loadTimer() async {
    return Timer(Duration(seconds: 3), navigate);
  }

  navigate(){
    Navigator.of(context).pushNamed('/home');
  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.deepPurple,
      body: Container(
        padding: EdgeInsets.all(40),
        alignment: Alignment.center,
        child: Image.network('https://itsallwidgets.com/images/logo.png'),
      ),
    );
  }
}
