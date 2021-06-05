import 'package:display/features/slider/data/models/slider_model.dart';
import 'package:display/features/slider/domain/enitities/slider_types.dart';
import 'package:flutter/cupertino.dart';

List<SliderTypesModel> slidersListfromJson(List str) =>
    List<SliderTypesModel>.from(str.map((e) => SliderTypesModel.fromJson(e)));

class SliderTypesModel extends SliderTypesEntity {
  SliderTypesModel({
    @required int id,
    @required String title,
    @required int sequenceNo,
    @required List<SliderModel> entity,
  }) : super(id: id, title: title, sequenceNo: sequenceNo, entity: entity);

  factory SliderTypesModel.fromJson(Map<String, dynamic> json) =>
      SliderTypesModel(
        id: json['id'],
        title: json['title'],
        sequenceNo: json['sequence_no'],
        entity: (json['sub_category'] as List)
            .map((e) => SliderModel.fromJson(e))
            .toList(),
      );
}
