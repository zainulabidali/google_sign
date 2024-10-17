import 'package:flutter/material.dart';
import 'package:google_login/Screens/Signup/signup_body.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BodySignup(),
    );
  }
}
