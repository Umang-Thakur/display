import 'package:display/features/slider/domain/enitities/slider_entity.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

class SliderTypesEntity extends Equatable {
  final int id;
  final String title;
  final int sequenceNo;
  final List<SliderEntity> entity;

  SliderTypesEntity({
    @required this.id,
    @required this.title,
    @required this.sequenceNo,
    @required this.entity,
  });

  @override
  // TODO: implement props
  List<Object> get props => [id, title, sequenceNo];
}
