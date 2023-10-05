import 'dart:async';

import 'package:flutter/material.dart';
import 'package:vediostream/Screen/Welcome/Login_Screen.dart';

import '../HomeSc.dart';


class SplashSc extends StatelessWidget {
  const SplashSc({super.key});

  @override
  Widget build(BuildContext context) {
    Timer(Duration(seconds: 2), () {
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => LoginSc(),
          ));
    });
    return Scaffold(
      body: Center(child: Text("Welcome")),
    );
  }
}
