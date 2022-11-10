import 'package:book_tickets/pages/login_page.dart';
import 'package:book_tickets/pages/signup_page.dart';
import 'package:flutter/material.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  bool login = true;

  changeScreen(bool state) {
    setState(() {
      login = state;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: login
            ? LoginPage(changeScreen: changeScreen)
            : SignupPage(changeScreen: changeScreen),
      ),
    );
  }
}