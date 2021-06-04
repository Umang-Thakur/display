import 'package:dartz/dartz.dart';
import 'package:display/core/error/failures.dart';
import 'package:display/features/upcoming_event/domain/entities/event_detail.dart';
import 'package:display/features/upcoming_event/domain/entities/upcoming_entity.dart';

abstract class UpcomingEventRepo {
  Future<Either<Failure, List<UpcomingEvent>>> getEventList();
  Future<Either<Failure, List<UpcomingEventDetail>>> getEvent(int id);
}
