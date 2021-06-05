import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:display/core/error/failures.dart';
import 'package:display/features/slider/domain/enitities/slider_types.dart';
import 'package:display/features/slider/domain/enitities/sub_slider_entity.dart';
import 'package:display/features/slider/domain/repository/slider_repo.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

part 'slider_event.dart';
part 'slider_state.dart';

const String SERVER_FAILURE_MESSAGE = 'Server Failure';
const String CACHE_FAILURE_MESSAGE = 'Cache Failure';
const String NETWORK_FAILURE_MESSAGE = 'Network Failure';

class SliderBloc extends Bloc<SliderEvent, SliderState> {
  final SliderRepository repository;

  SliderBloc({@required this.repository}) : super(SliderInitial());

  @override
  Stream<SliderState> mapEventToState(
    SliderEvent event,
  ) async* {
    if (event is SliderTypesLoadingEvent) {
      yield SliderTypesLoading();
    } else if (event is SubSliderLoadingEvent) {
      yield SubSliderLoading();
    } else if (event is GetSliderTypesEvent) {
      final list = await repository.getSlider();
      yield* _sliderListorError(list);
    } else if (event is GetSubSliderEvent) {
      final slider = await repository.getSubSLider(event.id);
      yield* _subSliderorError(slider);
    }
  }
}

Stream<SliderState> _sliderListorError(
  Either<Failure, List<SliderTypesEntity>> failureOrTrivia,
) async* {
  yield failureOrTrivia.fold(
    (failure) => Error(msg: _mapFailureToMessage(failure)),
    (list) => SliderTypesLoaded(list: list),
  );
}

Stream<SliderState> _subSliderorError(
  Either<Failure, SubSliderEntity> failureOrTrivia,
) async* {
  yield failureOrTrivia.fold(
    (failure) => Error(msg: _mapFailureToMessage(failure)),
    (entity) => SubSliderLoaded(entity: entity),
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
