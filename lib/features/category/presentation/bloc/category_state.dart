part of 'category_bloc.dart';

abstract class CategoryState extends Equatable {
  const CategoryState();

  @override
  List<Object> get props => [];
}

class CategoryInitial extends CategoryState {}

class CategoryListLoading extends CategoryState {}

class CategoryLoading extends CategoryState {}

class CategoryListLoaded extends CategoryState {
  final List<CategoryEntity> list;

  CategoryListLoaded({@required this.list});

  @override
  List<Object> get props => [list];
}

class CategoryLoaded extends CategoryState {
  final List<ImageEntity> list;

  CategoryLoaded({@required this.list});

  @override
  List<Object> get props => [list];
}

class Error extends CategoryState {
  final String msg;

  Error({@required this.msg});

  @override
  List<Object> get props => [msg];
}
