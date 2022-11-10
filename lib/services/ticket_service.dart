import 'package:book_tickets/models/ticket.dart';
import 'package:book_tickets/services/auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';

class TicketService{

  

  final database = FirebaseDatabase.instance.ref();
  final auth = AuthService();

  insertTicket(String title, String ticketcode, String studentid, String room, String seat, String date) async{

    final User ? user = auth.usuario;
    final uid = user!.uid;

    final newRef = database.child("${user.uid}/ticket");
    await newRef.update({
    'tittle': title,
    'ticket_code': ticketcode,
    'student_id': studentid,
    'room': room,
    'seat': seat,
    'date': date,
    'uid': auth.usuario!.uid
    });
  }

  readTicket() async{

    final User ? user = auth.usuario;
    final uid = user!.uid;

    final newRef = database.child("${user.uid}/ticket");
    final snapshot = await newRef.get();
  }
}