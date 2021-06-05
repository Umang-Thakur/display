import 'package:display/features/category/domain/entities/image_entity.dart';
import 'package:flutter/cupertino.dart';

List<ImageModel> imageListfromJson(List str) =>
    List<ImageModel>.from(str.map((x) => ImageModel.fromJson(x)));

class ImageModel extends ImageEntity {
  ImageModel({
    @required int id,
    @required String title,
    @required String image,
    @required String categoryId,
    @required String sequenceNo,
  }) : super(
            categoryId: categoryId,
            title: title,
            id: id,
            sequenceNo: sequenceNo,
            image: image);

  factory ImageModel.fromJson(Map<String, dynamic> json) => ImageModel(
      id: json['id'],
      title: json['title'],
      image: json['image'],
      categoryId: json['category_id'],
      sequenceNo: json['sequence_no']);
}
