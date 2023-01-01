import 'dart:async';

import 'package:flutter/material.dart';
import 'package:task1/pages/login.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3),
          ()=>Navigator.pushReplacement(context,
              MaterialPageRoute(builder:
                                (context) => 
                                LoginPage()
                                )
              )
);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
      height: double.infinity,
      width: double.infinity,
      child: new Container(
              width: 10.00,
              height: 10.00,
              decoration: new BoxDecoration(
              image: new DecorationImage(
                  image: ExactAssetImage('assets/logo.jpeg'),
                  
                  ),
        )
        ),
    ),
    );
  }
}