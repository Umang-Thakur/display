import 'package:dio/dio.dart';
import 'package:display/core/error/exception.dart';
import 'package:display/features/upcoming_event/data/models/upcoming_event_detail.dart';
import 'package:display/features/upcoming_event/data/models/upcoming_event_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:display/core/constants/urls.dart';

abstract class UpcomingEventRemote {
  Future<List<UpcomingEventDetailModel>> getEvent(int id);
  Future<List<UpcomingEventModel>> getEventList();
}

class UpcomingEventRemoteImpl implements UpcomingEventRemote {
  final Dio client;
  final String url = urlUpcomingEvent;
  final String url_detail = urlUpcomingEventDetail;

  UpcomingEventRemoteImpl({@required this.client});

  @override
  Future<List<UpcomingEventDetailModel>> getEvent(int id) async {
    Response response = await client.get(url + id.toString() + '/');

    if (response.statusCode == 200) {
      return upcomingEventDetailListfromJson(response.data['images']);
    } else {
      throw ServerException();
    }
  }

  @override
  Future<List<UpcomingEventModel>> getEventList() async {
    Response response = await client.get(url);

    if (response.statusCode == 200) {
      return upcomingEventListfromJson(response.data);
    } else {
      throw ServerException();
    }
  }
}
