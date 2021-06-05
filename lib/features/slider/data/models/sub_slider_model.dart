import 'package:display/features/slider/data/models/slider_image_model.dart';
import 'package:display/features/slider/data/models/slider_model.dart';
import 'package:display/features/slider/domain/enitities/sub_slider_entity.dart';
import 'package:flutter/cupertino.dart';

class SubSliderModel extends SubSliderEntity {
  SubSliderModel({
    @required SliderModel entity,
    @required List<SliderImageModel> images,
  }) : super(entity: entity, images: images);

  factory SubSliderModel.fromJson(Map<String, dynamic> json) => SubSliderModel(
      entity: SliderModel.fromJson(json),
      images: (json['images'] as List)
          .map((e) => SliderImageModel.fromJson(e))
          .toList());
}
