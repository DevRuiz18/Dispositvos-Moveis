import 'dart:ui';

class Ticket {
  String title;
  String ticketcode;
  int studentid;
  int room;
  String seat;
  String date;

  Ticket(
      {required this.title,
      required this.ticketcode,
      required this.room,
      required this.date,
      required this.studentid,
      required this.seat});
}
