import 'package:dartz/dartz.dart';
import 'package:display/core/error/exception.dart';
import 'package:display/core/error/failures.dart';
import 'package:display/core/network/network_info.dart';
import 'package:display/features/upcoming_event/data/sources/upcoming_event_repo.dart';
import 'package:display/features/upcoming_event/domain/entities/event_detail.dart';
import 'package:display/features/upcoming_event/domain/entities/upcoming_entity.dart';
import 'package:display/features/upcoming_event/domain/repository/upcoming_repo.dart';
import 'package:flutter/cupertino.dart';

class UpcomingEventRepoImpl implements UpcomingEventRepo {
  final UpcomingEventRemote remote;
  final NetworkInfo networkInfo;

  UpcomingEventRepoImpl({@required this.remote, @required this.networkInfo});

  @override
  Future<Either<Failure, List<UpcomingEventDetail>>> getEvent(int id) async {
    if (await networkInfo.isConnected) {
      try {
        final list = await remote.getEvent(id);
        return Right(list);
      } on ServerException {
        throw Left(ServerFailure());
      }
    }
  }

  @override
  Future<Either<Failure, List<UpcomingEvent>>> getEventList() async {
    if (await networkInfo.isConnected) {
      try {
        final list = await remote.getEventList();
        return Right(list);
      } on ServerException {
        throw Left(ServerFailure());
      }
    }
  }
}
