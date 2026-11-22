import 'package:cat_app/core/errors/failure.dart';
import 'package:cat_app/features/home/domain/entities/breed_entity.dart';
import 'package:cat_app/features/home/domain/entities/facts_entity.dart';
import 'package:dartz/dartz.dart';

abstract class CatRepository {
  Future<Either<Failure, FactsEntity>> getFacts();
  Future<Either<Failure, List<BreedEntity>>> getBreeds();
}
