import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:vediostream/Screen/Welcome/Login_Screen.dart';
import 'package:vediostream/resource/auth_method.dart';
import 'package:vediostream/utils/colors.dart';

import 'Screen/HomeSc.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Video Stream',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: backgroundColor,
      ),
      routes: {
        '/login': (context) => const LoginSc(),
        '/home': (context) => const HomeSc(),
      },
      home: StreamBuilder(
        stream: AuthMethods().authchanges,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasData) {
            return const HomeSc();
          }
          return const LoginSc();
        },
      ),
    );
  }
}
