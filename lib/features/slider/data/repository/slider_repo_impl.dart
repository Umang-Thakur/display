import 'package:dartz/dartz.dart';
import 'package:display/core/error/exception.dart';
import 'package:display/core/error/failures.dart';
import 'package:display/core/network/network_info.dart';
import 'package:display/features/slider/data/models/slider_types_model.dart';
import 'package:display/features/slider/data/sources/slider_remote_impl.dart';
import 'package:display/features/slider/domain/enitities/sub_slider_entity.dart';
import 'package:display/features/slider/domain/repository/slider_repo.dart';
import 'package:flutter/cupertino.dart';

class SliderRepoImpl implements SliderRepository {
  final NetworkInfo networkInfo;
  final SliderRemote remote;

  SliderRepoImpl({@required this.networkInfo, @required this.remote});

  @override
  Future<Either<Failure, List<SliderTypesModel>>> getSlider() async {
    if (await networkInfo.isConnected) {
      try {
        final list = await remote.getSliderList();
        return Right(list);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(NetworkFailure());
    }
  }

  @override
  Future<Either<Failure, SubSliderEntity>> getSubSLider(int id) async {
    if (await networkInfo.isConnected) {
      try {
        final slider = await remote.getSlider(id);
        return Right(slider);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(NetworkFailure());
    }
  }
}
