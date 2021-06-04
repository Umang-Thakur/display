import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:display/core/error/failures.dart';
import 'package:display/features/banner/domain/entities/banner_entity.dart';
import 'package:display/features/banner/domain/repository/banner_repo.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

part 'banner_event.dart';
part 'banner_state.dart';

const String SERVER_FAILURE_MESSAGE = 'Server Failure';
const String CACHE_FAILURE_MESSAGE = 'Cache Failure';
const String NETWORK_FAILURE_MESSAGE = 'Network Failure';

class BannerBloc extends Bloc<BannerEvent, BannerState> {
  final BannerRepository bannerRepository;

  BannerBloc({
    @required BannerRepository repo,
  })  : assert(repo != null),
        bannerRepository = repo,
        super(BannerInitial());

  @override
  Stream<BannerState> mapEventToState(
    BannerEvent event,
  ) async* {
    if (event is GetBannerListEvent) {
      // yield BannerLoading();
      final failureOrTrivia = await bannerRepository.getBanner();
      yield* _eitherLoadedOrErrorState(failureOrTrivia);
    } else if (event is LoadingEvent) {
      yield BannerLoading();
    }
  }
}

Stream<BannerState> _eitherLoadedOrErrorState(
  Either<Failure, List<BannerEntity>> failureOrTrivia,
) async* {
  yield failureOrTrivia.fold(
    (failure) => Error(msg: _mapFailureToMessage(failure)),
    (list) => BannerLoaded(list: list),
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
