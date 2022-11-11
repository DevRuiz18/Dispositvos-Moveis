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

class sign_up extends StatefulWidget {
  const sign_up({Key? key}) : super(key: key);

  @override
  _signupstate createState() => _signupstate();
}

class _signupstate extends State<sign_up> {
  // Define a key to access the form
  final _formKey = GlobalKey<FormState>();

  String _userEmail = '';
  String _userName = '';
  String _password = '';
  String _confirmPassword = '';

  // This function is triggered when the user press the "Sign Up" button
  void _trySubmitForm() {
    final bool? isValid = _formKey.currentState?.validate();
    if (isValid == true) {
      debugPrint('Everything looks good!');
      debugPrint(_userEmail);
      debugPrint(_userName);
      debugPrint(_password);
      debugPrint(_confirmPassword);

      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const BottomBar()),
      );

      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content:  Text('Successfully Signed Up', style: Styles.textStyle.copyWith(color: Colors.white)),
        backgroundColor: (Color.fromARGB(255, 60, 117, 56)),
        action: SnackBarAction(
          label: '',
          onPressed: () {},
        ),
      ));
      /* 
      Continute proccessing the provided information with your own logic 
      such us sending HTTP requests, savaing to SQLite database, etc.
      */
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Styles.bgColor,
        alignment: Alignment.center,
        child: Center(
          child: SingleChildScrollView(
            child: Card(
              margin: const EdgeInsets.symmetric(horizontal: 35),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        /// Eamil
                        SizedBox(height: AppLayout.getHeight(30.0),),
                        TextFormField(
                          decoration: const InputDecoration(labelText: 'Email',
                          border: OutlineInputBorder(),),
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

                        /// username
                        SizedBox(height: AppLayout.getHeight(30.0),),
                        TextFormField(
                          decoration:
                              const InputDecoration(labelText: 'Username',
                              border: OutlineInputBorder(),),
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return 'This field is required';
                            }
                            if (value.trim().length < 4) {
                              return 'Username must be at least 4 characters in length';
                            }
                            // Return null if the entered username is valid
                            return null;
                          },
                          onChanged: (value) => _userName = value,
                        ),

                        /// Password
                        SizedBox(height: AppLayout.getHeight(30.0),),
                        TextFormField(
                          decoration:
                              const InputDecoration(labelText: 'Password',
                              border: OutlineInputBorder(),),
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

                        /// Confirm Password
                        SizedBox(height: AppLayout.getHeight(30.0),),
                        TextFormField(
                          decoration: const InputDecoration(
                              labelText: 'Confirm Password',
                              border: OutlineInputBorder(),),
                          obscureText: true,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'This field is required';
                            }

                            if (value != _password) {
                              return 'Confimation password does not match the entered password';
                            }

                            return null;
                          },
                          onChanged: (value) => _confirmPassword = value,
                        ),
                        SizedBox(height: AppLayout.getHeight(30)),
                        Container(
                            child: OutlinedButton(
                                style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Styles.buttonColor)
                                ),
                                onPressed: _trySubmitForm,
                                child: Text("Sign up",
                                style:  Styles.textStyle.copyWith(color: Colors.white)),
                                ))
                      ],
                    )),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
