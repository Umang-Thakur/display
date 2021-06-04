import 'package:display/features/upcoming_event/domain/entities/event_detail.dart';
import 'package:flutter/cupertino.dart';

List<UpcomingEventDetailModel> upcomingEventDetailListfromJson(List str) =>
    List<UpcomingEventDetailModel>.from(
        str.map((x) => UpcomingEventDetailModel.fromJson(x)));

class UpcomingEventDetailModel extends UpcomingEventDetail {
  UpcomingEventDetailModel({
    @required int id,
    @required int upcomingEvent,
    @required String sequenceNo,
    @required String image,
  }) : super(
            id: id,
            image: image,
            sequenceNo: sequenceNo,
            upcomingEvent: upcomingEvent);

  factory UpcomingEventDetailModel.fromJson(Map<String, dynamic> json) =>
      UpcomingEventDetailModel(
          id: json['id'],
          upcomingEvent: json['up_coming_event'],
          sequenceNo: json['sequence_no'],
          image: json['image']);
}
