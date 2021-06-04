import 'package:dio/dio.dart';
import 'package:display/core/constants/urls.dart';
import 'package:display/core/error/exception.dart';
import 'package:display/features/banner/data/models/banner_model.dart';
import 'package:display/features/banner/domain/entities/banner_entity.dart';

abstract class BannerRemote {
  Future<List<BannerEntity>> call();
}

class BannerRemoteImpl implements BannerRemote {
  final Dio client;
  final String url = urlBannerList;

  BannerRemoteImpl({this.client});

  @override
  Future<List<BannerEntity>> call() async {
    Response response = await client.get(url);
    if (response.statusCode == 200) {
      return bannerListModelfromJson(response.data);
    } else {
      throw ServerException();
    }
  }
}
