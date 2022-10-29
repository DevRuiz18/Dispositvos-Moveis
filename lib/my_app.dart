import 'package:book_tickets/pages/home_page.dart';
import 'package:book_tickets/utils/app_styles.dart';
import 'package:book_tickets/widgets/auth_check.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: primary,
      ),
      home: AuthCheck(),
    );
  }
}
