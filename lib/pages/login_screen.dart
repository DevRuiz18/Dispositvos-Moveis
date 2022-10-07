import 'package:book_tickets/pages/bottom_bar.dart';
import 'package:book_tickets/pages/home_page.dart';
import 'package:book_tickets/pages/movie_view.dart';
import 'package:book_tickets/pages/sign_up.dart';
import 'package:book_tickets/pages/ticktet_view.dart';
import 'package:book_tickets/utils/app_info_list.dart';
import 'package:book_tickets/utils/app_layout.dart';
import 'package:book_tickets/utils/app_styles.dart';
import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:gap/gap.dart';

import '../widgets/double_text_widget.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _loginstate createState() => _loginstate();
}

class _loginstate extends State<LoginScreen> {
  // Define a key to access the form
  final _formKey = GlobalKey<FormState>();

  String _userEmail ='';
  String _password = '';

  // This function is triggered when the user press the "Login" button
  void _trySubmitForm() {
    final bool? isValid = _formKey.currentState?.validate();
    if (isValid == true) {
      debugPrint('Everything looks good!');
      debugPrint(_userEmail);
      debugPrint(_password);
       
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const BottomBar()),
      );
      /* 
      Continute proccessing the provided information with your own logic 
      such us sending HTTP requests, savaing to SQLite database, etc.
      */
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Styles.bgColor,
      body: Container(
        child: Form(
          key: _formKey,
          child: ListView(
        padding: EdgeInsets.symmetric(horizontal: 18.0),
        children: <Widget>[
          Column(children: <Widget>[
            SizedBox(
              height: AppLayout.getHeight(80),
            ),
            Image.asset('assets/images/avatar.png', scale: 11,),
            SizedBox(
              height: AppLayout.getHeight(10),
            ),
            Text(
              'Login',
              style: Styles.headLineStyle2,
            )
          ]),
          SizedBox(
            height: AppLayout.getHeight(20.0),
          ),
          TextFormField(
            textAlign: TextAlign.left,
            decoration:  InputDecoration(
              contentPadding: EdgeInsets.only( left: 20.0),
              labelText: 'Email',
              filled: true,
              fillColor: Colors.white,
              enabledBorder: OutlineInputBorder(borderSide: BorderSide(width: 3, color: Color(0xFFBA997C)),borderRadius: BorderRadius.circular(30),),),
            validator: (value) {
              if (value == null || value.trim().isEmpty) {
                return 'Please enter your email address';
              }
              // Check if the entered email has the right format
              if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
                return 'Please enter a valid email address';
              }
              // Return null if the entered email is valid
              return null;
            },
            onChanged: (value) => _userEmail = value,
          ),
          SizedBox(
            height: AppLayout.getHeight(10.0),
          ),
          TextFormField(
           textAlign: TextAlign.left,
            decoration:  InputDecoration(
              contentPadding: EdgeInsets.only( left: 20.0),
              labelText: 'Password',
              filled: true,
              fillColor: Colors.white,
              enabledBorder: OutlineInputBorder(borderSide: BorderSide(width: 3, color: Color(0xFFBA997C)),borderRadius: BorderRadius.circular(30),),
            ),
            obscureText: true,
            validator: (value) {
              if (value == null || value.trim().isEmpty) {
                return 'This field is required';
              }
              if (value.trim().length < 6) {
                return 'Password must be at least 6 characters in length';
              }
              // Return null if the entered password is valid
              return null;
            },
            onChanged: (value) => _password = value,
          ),
          SizedBox(height: AppLayout.getHeight(50)),
          Container(
              child: OutlinedButton(
            style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all<Color>(Styles.buttonColor)),
            onPressed: _trySubmitForm,
            child: Text("Login",
                style:  Styles.textStyle.copyWith(color: Colors.white)),
          )),
          SizedBox(
            height: AppLayout.getHeight(15.0),
          ),
          Column(children: <Widget>[
            TextButton(
              child: Text("Sign up",
                  style:  Styles.textStyle.copyWith(color: Colors.white)),
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Styles.buttonColor)),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const sign_up()),
                );
              },
            ),
          ]),
        ],
      ))),
    );
  }
}
