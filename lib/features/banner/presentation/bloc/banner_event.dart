part of 'banner_bloc.dart';

abstract class BannerEvent extends Equatable {
  const BannerEvent();

  @override
  List<Object> get props => [];
}

class GetBannerListEvent extends BannerEvent {}

class LoadingEvent extends BannerEvent {}
