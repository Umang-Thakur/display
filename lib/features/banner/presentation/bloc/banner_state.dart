part of 'banner_bloc.dart';

abstract class BannerState extends Equatable {
  const BannerState();

  @override
  List<Object> get props => [];
}

class BannerInitial extends BannerState {}

class BannerLoading extends BannerState {}

class BannerLoaded extends BannerState {
  final List<BannerEntity> list;

  BannerLoaded({@required this.list});

  @override
  List<Object> get props => [list];
}

class Error extends BannerState {
  final String msg;

  Error({@required this.msg});

  @override
  List<Object> get props => [msg];
}
