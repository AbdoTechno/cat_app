import 'package:cat_app/core/errors/failure.dart';
import 'package:cat_app/features/home/domain/entities/breed_entity.dart';
import 'package:cat_app/features/home/domain/repositories/cat_repository.dart';
import 'package:dartz/dartz.dart';

class GetBreedsUseCase {
  final CatRepository catRepository;

  GetBreedsUseCase({required this.catRepository});

  Future<Either<Failure, List<BreedEntity>>> call() async {
    return catRepository.getBreeds();
  }
}
