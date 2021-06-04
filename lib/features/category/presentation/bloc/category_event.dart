part of 'category_bloc.dart';

abstract class CategoryEvent extends Equatable {
  const CategoryEvent();

  @override
  List<Object> get props => [];
}

class GetCategoryListEvent extends CategoryEvent {}

class GetCategoryEvent extends CategoryEvent {
  final CategoryEntity entity;

  GetCategoryEvent(this.entity);

  @override
  List<Object> get props => [entity];
}

class CategoryLoadingEvent extends CategoryEvent {}

class CategoryListLoadingEvent extends CategoryEvent {}
