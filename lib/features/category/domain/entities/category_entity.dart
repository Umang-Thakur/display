import 'package:display/features/category/domain/entities/image_entity.dart';
import 'package:flutter/cupertino.dart';

class CategoryEntity {
  final int id;
  final String name;
  final String sequenceNo;
  List<ImageEntity> images;

  CategoryEntity(
      {@required this.id,
      @required this.name,
      @required this.sequenceNo,
      this.images});
}
