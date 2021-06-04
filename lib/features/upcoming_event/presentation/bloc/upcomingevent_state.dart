part of 'upcomingevent_bloc.dart';

abstract class UpcomingeventState extends Equatable {
  const UpcomingeventState();

  @override
  List<Object> get props => [];
}

class UpcomingeventInitial extends UpcomingeventState {}

class UpcomingeventLoading extends UpcomingeventState {}

class UpcomingeventListLoaded extends UpcomingeventState {
  final List<UpcomingEvent> list;

  UpcomingeventListLoaded({@required this.list});

  @override
  List<Object> get props => [list];
}

class UpcomingeventLoaded extends UpcomingeventState {
  final List<UpcomingEventDetail> list;
  UpcomingeventLoaded({
    @required this.list,
  });

  @override
  List<Object> get props => [list];
}

class Error extends UpcomingeventState {
  final String msg;

  Error({@required this.msg});

  @override
  List<Object> get props => [msg];
}
