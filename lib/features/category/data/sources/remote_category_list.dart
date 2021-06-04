import 'package:dio/dio.dart';
import 'package:display/core/constants/urls.dart';
import 'package:display/core/error/exception.dart';
import 'package:display/features/category/data/model/category_model.dart';
import 'package:display/features/category/data/model/image_model.dart';

abstract class CategoryRemote {
  Future<List<CategoryModel>> getCategoryList();
  Future<List<ImageModel>> getImageList(int id);
}

class CategoryRemoteImpl implements CategoryRemote {
  final Dio client;
  final String url = urlCategoryList;
  CategoryRemoteImpl({this.client});

  @override
  Future<List<CategoryModel>> getCategoryList() async {
    Response response = await client.get(url);

    if (response.statusCode == 200) {
      return categoryListfromJson(response.data);
    } else {
      throw ServerException();
    }
  }

  @override
  Future<List<ImageModel>> getImageList(int id) async {
    Response response = await client.get(url + '$id/');

    if (response.statusCode == 200) {
      return imageListfromJson(response.data['images']);
    } else {
      throw ServerException();
    }
  }
}
