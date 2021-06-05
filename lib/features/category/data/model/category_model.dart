import 'package:display/features/category/data/model/image_model.dart';
import 'package:display/features/category/domain/entities/category_entity.dart';
import 'package:display/features/category/domain/entities/image_entity.dart';
import 'package:flutter/cupertino.dart';

List<CategoryModel> categoryListfromJson(List str) =>
    List<CategoryModel>.from(str.map((x) => CategoryModel.fromJson(x)));

class CategoryModel extends CategoryEntity {
  CategoryModel({
    @required int id,
    @required String name,
    @required int sequenceNo,
    List<ImageModel> images,
  }) : super(id: id, name: name, sequenceNo: sequenceNo, images: images);

  factory CategoryModel.fromJson(Map<String, dynamic> json) => CategoryModel(
      id: json['id'], name: json['name'], sequenceNo: json['sequence_no']);
}
