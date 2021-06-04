part of 'upcomingevent_bloc.dart';

abstract class UpcomingeventEvent extends Equatable {
  const UpcomingeventEvent();

  @override
  List<Object> get props => [];
}

class GetUpcomingEventList extends UpcomingeventEvent {}

class GetUpcomingEvent extends UpcomingeventEvent {
  final int id;

  GetUpcomingEvent({@required this.id});

  @override
  List<Object> get props => [id];
}

class UpcomingEventLoading extends UpcomingeventEvent {}

class UpcomingEventListLoading extends UpcomingeventEvent {}
