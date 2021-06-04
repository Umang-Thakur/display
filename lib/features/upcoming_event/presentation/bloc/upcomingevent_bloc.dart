import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:display/core/error/failures.dart';
import 'package:display/features/upcoming_event/domain/entities/event_detail.dart';
import 'package:display/features/upcoming_event/domain/entities/upcoming_entity.dart';
import 'package:display/features/upcoming_event/domain/repository/upcoming_repo.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

part 'upcomingevent_event.dart';
part 'upcomingevent_state.dart';

const String SERVER_FAILURE_MESSAGE = 'Server Failure';
const String CACHE_FAILURE_MESSAGE = 'Cache Failure';
const String NETWORK_FAILURE_MESSAGE = 'Network Failure';

class UpcomingeventBloc extends Bloc<UpcomingeventEvent, UpcomingeventState> {
  final UpcomingEventRepo repository;

  UpcomingeventBloc({@required this.repository})
      : super(UpcomingeventInitial());

  @override
  Stream<UpcomingeventState> mapEventToState(
    UpcomingeventEvent event,
  ) async* {
    if (event is UpcomingEventListLoading) {
      yield UpcomingeventListLoading();
    } else if (event is UpcomingEventLoading) {
      yield UpcomingeventLoading();
    } else if (event is GetUpcomingEventList) {
      final list = await repository.getEventList();
      yield* _upcomingEventListorError(list);
    } else if (event is GetUpcomingEvent) {
      final list = await repository.getEvent(event.id);
      yield* _upcomingEventorError(list);
    }
  }
}

Stream<UpcomingeventState> _upcomingEventListorError(
  Either<Failure, List<UpcomingEvent>> failureOrTrivia,
) async* {
  yield failureOrTrivia.fold(
    (failure) => Error(msg: _mapFailureToMessage(failure)),
    (list) => UpcomingeventListLoaded(list: list),
  );
}

Stream<UpcomingeventState> _upcomingEventorError(
  Either<Failure, List<UpcomingEventDetail>> failureOrTrivia,
) async* {
  yield failureOrTrivia.fold(
    (failure) => Error(msg: _mapFailureToMessage(failure)),
    (list) => UpcomingeventLoaded(list: list),
  );
}

String _mapFailureToMessage(Failure failure) {
  switch (failure.runtimeType) {
    case ServerFailure:
      return SERVER_FAILURE_MESSAGE;
    case CacheFailure:
      return CACHE_FAILURE_MESSAGE;
    case NetworkFailure:
      return NETWORK_FAILURE_MESSAGE;
    default:
      return 'Unexpected error';
  }
}
