import 'package:dartz/dartz.dart';
import 'package:display/core/error/exception.dart';
import 'package:display/core/error/failures.dart';
import 'package:display/core/network/network_info.dart';
import 'package:display/features/banner/data/sources/banner_list_remote.dart';
import 'package:display/features/banner/domain/entities/banner_entity.dart';
import 'package:display/features/banner/domain/repository/banner_repo.dart';
import 'package:flutter/cupertino.dart';

class BannerListRepoImpl implements BannerRepository {
  final BannerRemote remote;
  final NetworkInfo networkInfo;

  BannerListRepoImpl({@required this.remote, @required this.networkInfo});

  @override
  Future<Either<Failure, List<BannerEntity>>> getBanner() async {
    if (await networkInfo.isConnected) {
      try {
        final remoteBanner = await remote.call();
        return Right(remoteBanner);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(NetworkFailure());
    }
  }
}
