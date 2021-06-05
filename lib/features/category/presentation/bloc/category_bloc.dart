import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:display/core/error/failures.dart';
import 'package:display/features/category/domain/entities/category_entity.dart';
import 'package:display/features/category/domain/entities/image_entity.dart';
import 'package:display/features/category/domain/repository/category_repo.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

part 'category_event.dart';
part 'category_state.dart';

const String SERVER_FAILURE_MESSAGE = 'Server Failure';
const String CACHE_FAILURE_MESSAGE = 'Cache Failure';
const String NETWORK_FAILURE_MESSAGE = 'Network Failure';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  final CategoryRepository repository;
  CategoryBloc({@required this.repository}) : super(CategoryInitial());

  @override
  Stream<CategoryState> mapEventToState(
    CategoryEvent event,
  ) async* {
    if (event is GetCategoryListEvent) {
      final list = await repository.getCategoryList();
      yield* _categoryListorError(list);
    } else if (event is CategoryListLoadingEvent) {
      yield CategoryListLoading();
    } else if (event is CategoryLoadingEvent) {
      yield CategoryLoading();
    } else if (event is GetCategoryEvent) {
      final images = await repository.getCategory(event.entity.id);
      yield* _categoryorError(images);
    }
  }
}

Stream<CategoryState> _categoryListorError(
  Either<Failure, List<CategoryEntity>> failureOrTrivia,
) async* {
  yield failureOrTrivia.fold(
    (failure) => Error(msg: _mapFailureToMessage(failure)),
    (list) => CategoryListLoaded(list: list),
  );
}

Stream<CategoryState> _categoryorError(
  Either<Failure, List<ImageEntity>> failureOrTrivia,
) async* {
  yield failureOrTrivia.fold(
    (failure) => Error(msg: _mapFailureToMessage(failure)),
    (list) => CategoryLoaded(list: list),
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
