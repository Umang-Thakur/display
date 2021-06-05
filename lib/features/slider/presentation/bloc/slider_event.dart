part of 'slider_bloc.dart';

abstract class SliderEvent extends Equatable {
  const SliderEvent();

  @override
  List<Object> get props => [];
}

class GetSliderTypesEvent extends SliderEvent {}

class GetSubSliderEvent extends SliderEvent {
  final int id;

  GetSubSliderEvent({@required this.id});

  @override
  List<Object> get props => [id];
}

class SliderTypesLoadingEvent extends SliderEvent {}

class SubSliderLoadingEvent extends SliderEvent {}
