import 'package:display/features/slider/data/models/slider_types_model.dart';
import 'package:display/features/slider/domain/enitities/slider_entity.dart';
import 'package:flutter/cupertino.dart';

List<SliderModel> sliderListfromJson(List str) =>
    List<SliderModel>.from(str.map((e) => SliderTypesModel.fromJson(e)));

class SliderModel extends SliderEntity {
  SliderModel({
    @required int id,
    @required String image,
    @required String title,
    @required int sequenceNo,
    @required int subCategory,
  }) : super(
            id: id,
            image: image,
            title: title,
            sequenceNo: sequenceNo,
            subCategory: subCategory);

  factory SliderModel.fromJson(Map<String, dynamic> json) => SliderModel(
      id: json['id'],
      image: json['image'],
      title: json['title'],
      sequenceNo: json['sequence_no'],
      subCategory: json['slider_category']);
}
