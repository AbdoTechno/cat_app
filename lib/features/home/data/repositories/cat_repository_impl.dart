import 'package:cat_app/core/errors/failure.dart';
import 'package:cat_app/features/home/data/datasources/cat_local_data_source.dart';
import 'package:cat_app/features/home/data/datasources/cat_remote_data_source.dart';
import 'package:cat_app/features/home/domain/entities/facts_entity.dart';
import 'package:cat_app/features/home/domain/repositories/cat_repository.dart';
import 'package:dartz/dartz.dart';

class CatRepositoryImpl implements CatRepository {
  final CatRemoteDataSource remoteDataSource;
  final CatLocalDataSource localDataSource;

  CatRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
  });

  @override
  Future<Either<Failure, FactsEntity>> getFacts() async {
    // 1. Try fetching from API first
    final remoteResult = await remoteDataSource.getCatFacts();
    return remoteResult.fold(
      (failure) async {
        // 2. API failed, fallback to cache
        final localResult = await localDataSource.getCatFacts();
        return localResult.fold(
          (message) => Left(Failure(errMessage: message)),
          (facts) => Right(facts),
        );
      },
      (facts) async {
        // 3. API succeeded, update cache
        try {
          await localDataSource.cacheCatFacts(facts);
        } catch (_) {
          // Don't fail if caching fails
        }
        // 4. Return latest API data
        return Right(facts);
      },
    );
  }
}
