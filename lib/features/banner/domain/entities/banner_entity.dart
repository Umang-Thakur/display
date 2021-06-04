import 'package:flutter/cupertino.dart';

class BannerEntity {
  final int id;
  final String name;
  final String imageUrl;
  final String deeplink;

  BannerEntity(
      {@required this.id,
      @required this.name,
      @required this.imageUrl,
      @required this.deeplink});
}
