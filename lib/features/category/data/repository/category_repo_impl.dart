import 'package:dartz/dartz.dart';
import 'package:display/core/error/exception.dart';
import 'package:display/core/error/failures.dart';
import 'package:display/core/network/network_info.dart';
import 'package:display/features/category/data/sources/remote_category_list.dart';
import 'package:display/features/category/domain/entities/category_entity.dart';
import 'package:display/features/category/domain/entities/image_entity.dart';
import 'package:display/features/category/domain/repository/category_repo.dart';
import 'package:flutter/cupertino.dart';

class CategoryRepoImpl implements CategoryRepository {
  final NetworkInfo networkInfo;
  final CategoryRemote remote;

  CategoryRepoImpl({@required this.networkInfo, @required this.remote});

  @override
  Future<Either<Failure, List<ImageEntity>>> getCategory(int id) async {
    if (await networkInfo.isConnected) {
      try {
        final category = await remote.getImageList(id);
        return Right(category);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(NetworkFailure());
    }
  }

  @override
  Future<Either<Failure, List<CategoryEntity>>> getCategoryList() async {
    if (await networkInfo.isConnected) {
      try {
        final categoryList = await remote.getCategoryList();
        return Right(categoryList);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(NetworkFailure());
    }
  }
}
