import 'package:flutter/material.dart';
import 'package:vediostream/Screen/HomeSc.dart';
import 'package:vediostream/widgets/custom_button.dart';

import '../../resource/auth_method.dart';

class LoginSc extends StatefulWidget {
  const LoginSc({super.key});

  @override
  State<LoginSc> createState() => _LoginScState();
}

class _LoginScState extends State<LoginSc> {
  final AuthMethods _authMethods = AuthMethods();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Text(
          "Start or join a metting",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 38),
          child: Image.asset('assets/onboarding.jpg'),
        ),
        CustomButton(
            onPressed: () async {
              bool res = await _authMethods.signInWithGoogle(context);
              if (res) {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HomeSc(),
                    ));
              }
            },
            text: "Google Sign in.."),
      ]),
    );
  }
}
