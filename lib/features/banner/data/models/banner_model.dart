import 'package:display/features/banner/domain/entities/banner_entity.dart';
import 'package:flutter/cupertino.dart';

List<BannerModel> bannerListModelfromJson(List str) =>
    List<BannerModel>.from(str.map((x) => BannerModel.fromJson(x)));

class BannerModel extends BannerEntity {
  BannerModel(
      {@required int id,
      @required String name,
      @required String imageUrl,
      @required String deeplink})
      : super(id: id, name: name, imageUrl: imageUrl, deeplink: deeplink);

  factory BannerModel.fromJson(Map<String, dynamic> json) => BannerModel(
      id: json['id'],
      name: json['name'],
      imageUrl: json['image'],
      deeplink: json['deep_link']);
}
