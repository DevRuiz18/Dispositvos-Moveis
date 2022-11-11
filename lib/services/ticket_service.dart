import 'dart:math';
import 'package:book_tickets/models/ticket.dart';
import 'package:book_tickets/services/auth_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;

class TicketService{

  final database = FirebaseDatabase.instance.ref();
  //final auth = AuthService().getUser();
  String uid = '';

  insertTicket(String title, String ticketcode, int studentid, int room, String seat, String date, String sessiontime) async{
    uid = auth.FirebaseAuth.instance.currentUser!.uid;
    
    var rng = Random();
    var k = rng.nextInt(10000);
    final newRef = database.child("${uid}/ticket/$k");
    await newRef.update({
    'title': title,
    'ticket_code': ticketcode,
    'student_id': studentid,
    'room': room,
    'seat': seat,
    'date': date,
    'session_time': sessiontime,
    });
  }

  getTickets() async {
    List<Ticket> tickets = [];
    uid = auth.FirebaseAuth.instance.currentUser!.uid;

    DatabaseReference ref = FirebaseDatabase.instance.ref("${uid}/ticket");

    DataSnapshot data = await FirebaseDatabase.instance.ref("${uid}/ticket").get();
    
    data.children.forEach((el) {
      int id = 1;
      String title = '';
      String ticketcode = '';
      String seat = '';
      String date = '';
      String sessiontime = '';
      int studentid = 0;
      int room = 0;

      id = int.parse(el.key.toString());
      el.children.forEach((element) { 
        try {

          switch(element.key) {
              case 'date':
                date = element.value.toString(); 
              break;
              case 'session_time':
                sessiontime = element.value.toString(); 
              break;
              case 'title':
                title = element.value.toString(); 
              break;
              case 'seat':
                seat = element.value.toString(); 
              break;
              case 'ticket_code':
                ticketcode = element.value.toString(); 
              break;
              case 'student_id':
                studentid = int.parse(element.value.toString());
              break;
              case 'room':
                room = int.parse(element.value.toString());
              break;
          }
        }catch (e) {
          print('TIPO DE \n DADO MODO BURRO');
        }
      });
      tickets.add(new Ticket(
          id: id,
          title: title,
          ticketcode: ticketcode,
          room: room,
          date: date,
          studentid: studentid,
          sessiontime: sessiontime,
          seat: seat
          )
      );
    });

    return tickets;

  }
}