import 'package:dartz/dartz.dart';
import 'package:display/core/error/failures.dart';
import 'package:display/features/banner/domain/entities/banner_entity.dart';

abstract class BannerRepository {
  Future<Either<Failure, List<BannerEntity>>> getBanner();
}
