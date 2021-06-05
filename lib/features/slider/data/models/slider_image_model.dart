import 'package:display/features/slider/domain/enitities/images_entity.dart';
import 'package:flutter/cupertino.dart';

List<SliderImageModel> sliderImageListfromJson(List str) =>
    List<SliderImageModel>.from(str.map((e) => SliderImageModel.fromJson(e)));

class SliderImageModel extends SliderImageEntity {
  SliderImageModel({
    @required int id,
    @required String image,
    @required int sequenceNo,
    @required int subCategory,
  }) : super(
            id: id,
            image: image,
            sequenceNo: sequenceNo,
            subCategory: subCategory);

  factory SliderImageModel.fromJson(Map<String, dynamic> json) =>
      SliderImageModel(
          id: json['id'],
          image: json['image'],
          sequenceNo: json['sequence_no'],
          subCategory: json['sub_category']);
}
