import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

class SliderEntity extends Equatable {
  final int id;
  final String image;
  final String title;
  final int sequenceNo;
  final int subCategory;

  SliderEntity(
      {@required this.id,
      @required this.image,
      @required this.title,
      @required this.sequenceNo,
      @required this.subCategory});

  @override
  // TODO: implement props
  List<Object> get props => [id, image, title, sequenceNo, subCategory];
}
