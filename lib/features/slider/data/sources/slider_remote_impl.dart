import 'package:dio/dio.dart';
import 'package:display/core/error/exception.dart';
import 'package:display/core/error/failures.dart';
import 'package:display/features/slider/data/models/slider_types_model.dart';
import 'package:display/features/slider/data/models/sub_slider_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:display/core/constants/urls.dart';

abstract class SliderRemote {
  Future<List<SliderTypesModel>> getSliderList();
  Future<SubSliderModel> getSlider(int id);
}

class SliderRemoteImpl implements SliderRemote {
  final Dio client;
  final String url = urlSliderList;
  final String urlDetail = urlSubSlider;

  SliderRemoteImpl({@required this.client});

  @override
  Future<SubSliderModel> getSlider(int id) async {
    try {
      Response response = await client.get(urlDetail + id.toString() + '/');
      if (response.statusCode == 200) {
        return SubSliderModel.fromJson(response.data);
      } else {
        throw ServerException();
      }
    } on ServerException {
      throw (ServerFailure());
    }
  }

  @override
  Future<List<SliderTypesModel>> getSliderList() async {
    try {
      Response response = await client.get(url);
      if (response.statusCode == 200) {
        return slidersListfromJson(response.data);
      } else {
        throw ServerException();
      }
    } on ServerException {
      throw (ServerFailure());
    }
  }
}
