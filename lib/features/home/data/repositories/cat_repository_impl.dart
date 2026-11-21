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
  Future<Either<Failure, FactsEntity>> getFacts() {
    return remoteDataSource.getCatFacts();
  }
}
