import 'package:flutter/cupertino.dart';

class ImageEntity {
  final int id;
  final String title;
  final String image;
  final String categoryId;
  final String sequenceNo;

  ImageEntity(
      {@required this.id,
      @required this.title,
      @required this.image,
      @required this.categoryId,
      @required this.sequenceNo});
}
