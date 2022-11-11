import 'package:book_tickets/services/auth_service.dart';
import 'package:book_tickets/utils/app_layout.dart';
import 'package:book_tickets/utils/app_styles.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;

class ProfilePage extends StatefulWidget {
  ProfilePage({Key? key}) : super(key: key);
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    final auth.FirebaseAuth _firebaseAuth = auth.FirebaseAuth.instance;
    final String firebaseUser =
        _firebaseAuth.currentUser!.displayName ?? 'Unknown user';
    final String firebaseEmail =
        _firebaseAuth.currentUser!.email as String;
    return Scaffold(
      backgroundColor: Styles.bgColor,
      body: SingleChildScrollView(
          child: Padding(
        padding: EdgeInsets.only(top: 70),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  Row(
                    children: [
                      Column(
                        children: [
                          Image.asset(
                            'assets/images/avatar.png',
                            scale: 12,
                          ),
                        ],
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 25),
                        child: Column(
                          children: [
                            Text(
                              firebaseUser,
                              style: Styles.headLineStyle1,
                            ),
                            Text(
                              firebaseEmail,
                              style: Styles.headLineStyle3,
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: AppLayout.getHeight(50),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text('Movie watchtime sum: ',
                                style: Styles.headLineStyle2
                                    .copyWith(color: const Color(0xFF3b3b3b))),
                            Text('79h 47min',
                                style: Styles.headLineStyle3
                                    .copyWith(color: const Color(0xFF3b3b3b))),
                          ],
                        ),
                        SizedBox(
                          height: AppLayout.getHeight(20),
                        ),
                        Row(
                          children: [
                            Text('Total movies watched: ',
                                style: Styles.headLineStyle2
                                    .copyWith(color: const Color(0xFF3b3b3b))),
                            Text('45',
                                style: Styles.headLineStyle3
                                    .copyWith(color: const Color(0xFF3b3b3b))),
                          ],
                        ),
                        SizedBox(
                          height: AppLayout.getHeight(20),
                        ),
                        Row(
                          children: [
                            Text('Favorite director: ',
                                style: Styles.headLineStyle2
                                    .copyWith(color: const Color(0xFF3b3b3b))),
                            Text('Christopher Nolan ',
                                style: Styles.headLineStyle3
                                    .copyWith(color: const Color(0xFF3b3b3b))),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 65),
                child: OutlinedButton(
                  onPressed: () => context.read<AuthService>().logout(),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Text(
                          'Log out',
                          style: TextStyle(fontSize: 18, color: Colors.red),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Row(
                  children: [
                    Column(),
                  ],
                ),
              ),
            ],
          ),
        ),
      )),
    );
  }
}
