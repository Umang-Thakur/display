import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:dio/dio.dart';
import 'package:display/core/network/network_info.dart';
import 'package:display/features/banner/data/repository/banner_list_repo_impl.dart';
import 'package:display/features/banner/data/sources/banner_list_remote.dart';
import 'package:display/features/banner/domain/repository/banner_repo.dart';
import 'package:display/features/banner/presentation/bloc/banner_bloc.dart';
import 'package:display/features/upcoming_event/domain/repository/upcoming_repo.dart';
import 'package:display/features/upcoming_event/presentation/bloc/upcomingevent_bloc.dart';
import 'package:get_it/get_it.dart';

import 'features/upcoming_event/data/repository/upcoming_event_repo_impl.dart';
import 'features/upcoming_event/data/sources/upcoming_event_repo.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // Blocs
  // - Banner
  sl.registerFactory(() => BannerBloc(repo: sl()));
  sl.registerFactory(() => UpcomingeventBloc(repository: sl()));

  // - Repositories
  sl.registerLazySingleton<BannerRepository>(
      () => BannerListRepoImpl(networkInfo: sl(), remote: sl()));
  sl.registerLazySingleton<UpcomingEventRepo>(
      () => UpcomingEventRepoImpl(networkInfo: sl(), remote: sl()));

  // - Data Sources
  sl.registerLazySingleton<BannerRemote>(() => BannerRemoteImpl(client: sl()));
  sl.registerLazySingleton<UpcomingEventRemote>(
      () => UpcomingEventRemoteImpl(client: sl()));

  // -Core
  sl.registerLazySingleton<NetworkInfo>(
      () => NetworkInfoImpl(connectionChecker: sl()));

  // - External
  sl.registerLazySingleton(() => Dio());
  sl.registerLazySingleton(() => DataConnectionChecker());
}
