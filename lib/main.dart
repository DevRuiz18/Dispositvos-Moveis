import 'package:book_tickets/my_app.dart';
import 'package:book_tickets/services/auth_service.dart';
import 'package:book_tickets/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'pages/home_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(/*const MyApp()*/
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AuthService()),

      ],
      child: MyApp(),
    ),
  );
}