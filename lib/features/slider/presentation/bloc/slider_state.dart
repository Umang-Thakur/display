part of 'slider_bloc.dart';

abstract class SliderState extends Equatable {
  const SliderState();

  @override
  List<Object> get props => [];
}

class SliderInitial extends SliderState {}

class SliderTypesLoading extends SliderState {}

class SubSliderLoading extends SliderState {}

class SubSliderLoaded extends SliderState {
  final SubSliderEntity entity;

  SubSliderLoaded({@required this.entity});

  @override
  List<Object> get props => [entity];
}

class SliderTypesLoaded extends SliderState {
  final List<SliderTypesEntity> list;

  SliderTypesLoaded({@required this.list});

  @override
  List<Object> get props => [list];
}

class Error extends SliderState {
  final String msg;

  Error({@required this.msg});

  @override
  List<Object> get props => [msg];
}
