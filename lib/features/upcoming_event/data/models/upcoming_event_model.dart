import 'package:display/features/upcoming_event/domain/entities/upcoming_entity.dart';
import 'package:flutter/cupertino.dart';

List<UpcomingEventModel> upcomingEventListfromJson(List str) =>
    List<UpcomingEventModel>.from(
        str.map((x) => UpcomingEventModel.fromJson(x)));

class UpcomingEventModel extends UpcomingEvent {
  UpcomingEventModel({
    @required int id,
    @required String title,
    @required String date,
    @required String image,
  }) : super(date: date, id: id, title: title, image: image);

  factory UpcomingEventModel.fromJson(Map<String, dynamic> json) =>
      UpcomingEventModel(
          id: json['id'],
          title: json['title'],
          date: json['date'],
          image: json['image']);
}
