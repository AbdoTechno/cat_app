import 'package:cat_app/core/errors/failure.dart';
import 'package:cat_app/features/home/domain/entities/facts_entity.dart';
import 'package:cat_app/features/home/domain/repositories/cat_repository.dart';
import 'package:dartz/dartz.dart';

class GetCatFactsUseCase {
    final CatRepository catRepository;
    GetCatFactsUseCase({required this.catRepository});
   Future<Either<Failure, FactsEntity>> call() async {
      return await catRepository.getFacts();
    }
}