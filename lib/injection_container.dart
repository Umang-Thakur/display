import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:dio/dio.dart';
import 'package:display/core/network/network_info.dart';
import 'package:display/features/banner/data/repository/banner_list_repo_impl.dart';
import 'package:display/features/banner/data/sources/banner_list_remote.dart';
import 'package:display/features/banner/domain/repository/banner_repo.dart';
import 'package:display/features/banner/presentation/bloc/banner_bloc.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // Blocs
  // - Banner
  sl.registerFactory(() => BannerBloc(repo: sl()));

  // - Repositories
  sl.registerLazySingleton<BannerRepository>(
      () => BannerListRepoImpl(networkInfo: sl(), remote: sl()));

  // - Data Sources
  sl.registerLazySingleton<BannerRemote>(() => BannerRemoteImpl(client: sl()));

  // -Core
  sl.registerLazySingleton<NetworkInfo>(
      () => NetworkInfoImpl(connectionChecker: sl()));

  // - External
  sl.registerLazySingleton(() => Dio());
  sl.registerLazySingleton(() => DataConnectionChecker());
}
