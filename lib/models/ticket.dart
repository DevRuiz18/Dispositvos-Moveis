import 'dart:ui';

class Ticket {
  int? id;
  String title;
  String ticketcode;
  int studentid;
  int room; 
  String seat;
  String date;
  String sessiontime;
  Ticket(
      {
      this.id,
      required this.title,
      required this.ticketcode,
      required this.room,
      required this.date,
      required this.sessiontime,
      required this.studentid,
      required this.seat}
      );
}
