import 'package:flutter/cupertino.dart';

class UpcomingEvent {
  final int id;
  final String title;
  final String date;
  final String image;

  UpcomingEvent(
      {@required this.id,
      @required this.title,
      @required this.date,
      @required this.image});
}
