import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';
import 'package:cat_app/core/databases/api/dio_service.dart';
import 'package:cat_app/core/databases/cache/cache_helper.dart';
import 'package:cat_app/features/home/data/datasources/cat_local_data_source.dart';
import 'package:cat_app/features/home/data/datasources/cat_remote_data_source.dart';
import 'package:cat_app/features/home/data/repositories/cat_repository_impl.dart';
import 'package:cat_app/features/home/domain/repositories/cat_repository.dart';
import 'package:cat_app/features/home/domain/usecases/get_cat_facts_use_case.dart';
import 'package:cat_app/features/home/presentation/controller/home_cubit.dart';

final gitIt = GetIt.instance;
final getIt = gitIt;

Future<void> setupServiceLocator() async {
  if (gitIt.isRegistered<Dio>()) {
    return;
  }

  gitIt.registerLazySingleton<Dio>(() => Dio());
  gitIt.registerLazySingleton<DioService>(() => DioService(gitIt<Dio>()));

  final cacheHelper = CacheHelper();
  await cacheHelper.init();
  gitIt.registerLazySingleton<CacheHelper>(() => cacheHelper);

  gitIt.registerLazySingleton<CatRemoteDataSource>(
    () => CatRemoteDataSourceImpl(dioService: gitIt<DioService>()),
  );
  gitIt.registerLazySingleton<CatLocalDataSource>(CatLocalDataSourceImpl.new);
  gitIt.registerLazySingleton<CatRepository>(
    () => CatRepositoryImpl(
      remoteDataSource: gitIt<CatRemoteDataSource>(),
      localDataSource: gitIt<CatLocalDataSource>(),
    ),
  );
  gitIt.registerLazySingleton<GetCatFactsUseCase>(
    () => GetCatFactsUseCase(catRepository: gitIt<CatRepository>()),
  );
  gitIt.registerFactory<HomeCubit>(
    () => HomeCubit(getFactsUseCase: gitIt<GetCatFactsUseCase>()),
  );
}
