import 'dart:async';

import 'package:cat_app/core/errors/failure.dart';
import 'package:cat_app/features/home/data/models/facts_model.dart';
import 'package:cat_app/features/home/domain/entities/breed_entity.dart';
import 'package:cat_app/features/home/domain/entities/facts_entity.dart';
import 'package:cat_app/features/home/domain/repositories/cat_repository.dart';
import 'package:cat_app/features/home/domain/usecases/get_cat_facts_use_case.dart';
import 'package:cat_app/features/home/presentation/controller/home_cubit.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('does not emit if the cubit closes before facts load', () async {
    final repository = _PendingCatRepository();
    final cubit = HomeCubit(
      getFactsUseCase: GetCatFactsUseCase(catRepository: repository),
    );

    final request = cubit.getCatFacts();
    await cubit.close();
    repository.facts.complete(
      Right(FactsModel(fact: 'Cats sleep a lot.', length: 20)),
    );

    await expectLater(request, completes);
  });
}

class _PendingCatRepository implements CatRepository {
  final facts = Completer<Either<Failure, FactsEntity>>();

  @override
  Future<Either<Failure, FactsEntity>> getFacts() => facts.future;

  @override
  Future<Either<Failure, List<BreedEntity>>> getBreeds() async =>
      const Right([]);
}
