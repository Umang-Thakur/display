import 'package:dartz/dartz.dart';
import 'package:display/features/category/domain/entities/category_entity.dart';
import 'package:display/core/error/failures.dart';
import 'package:display/features/category/domain/entities/image_entity.dart';

abstract class CategoryRepository {
  Future<Either<Failure, List<CategoryEntity>>> getCategoryList();
  Future<Either<Failure, List<ImageEntity>>> getCategory(int id);
}
