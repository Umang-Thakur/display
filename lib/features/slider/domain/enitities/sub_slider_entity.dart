import 'package:display/features/slider/domain/enitities/images_entity.dart';
import 'package:display/features/slider/domain/enitities/slider_entity.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

class SubSliderEntity extends Equatable {
  final SliderEntity entity;
  final List<SliderImageEntity> images;

  SubSliderEntity({@required this.entity, @required this.images});

  @override
  // TODO: implement props
  List<Object> get props => [entity, images];
}
