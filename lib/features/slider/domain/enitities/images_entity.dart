import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

class SliderImageEntity extends Equatable {
  final int id;
  final String image;
  final int sequenceNo;
  final int subCategory;

  SliderImageEntity(
      {@required this.id,
      @required this.image,
      @required this.sequenceNo,
      @required this.subCategory});

  @override
  // TODO: implement props
  List<Object> get props => [id, image, sequenceNo, subCategory];
}
