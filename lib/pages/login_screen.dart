import 'package:book_tickets/pages/movie_view.dart';
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

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Styles.bgColor,
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 18.0),
          children: <Widget>[
            Column(
              children: <Widget>[
                SizedBox(height: 120,),
                Image.asset('assets/images/logo.png'),
                SizedBox(height: 30,),
                Text('Login', style: TextStyle(fontSize: 25, color: Colors.greenAccent),)
              ]
            ),
            SizedBox(height: 60.0,),
            TextField(
              decoration: InputDecoration(
                labelText: "Email",
                labelStyle: TextStyle(fontSize: 20),
                filled: true,
              ),
            ),
            SizedBox(height: 20.0,),
            TextField(
              obscureText: true,
              decoration: InputDecoration(
                labelText: "Password",
                labelStyle: TextStyle(fontSize: 20),
                filled: true,
              ),
            ),
            SizedBox(height: 20.0,),
            Column(
              children: <Widget>[
                TextButton(
                  style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Colors.blueAccent)
                  ),
                  onPressed:(() => {}), 
                  child: Text("Login", style: 
                     TextStyle(fontSize: 20, color: Colors.white)
                  ),
                ),
              ]
            ),
            ],
            )
        ),
      );
  }
}