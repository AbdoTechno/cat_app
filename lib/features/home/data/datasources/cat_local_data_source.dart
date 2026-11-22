import 'package:cat_app/core/databases/cache/hive_services.dart';
import 'package:cat_app/features/home/data/models/facts_model.dart';
import 'package:cat_app/features/home/domain/entities/facts_entity.dart';
import 'package:dartz/dartz.dart';

abstract class CatLocalDataSource {
  Future<Either<String, FactsEntity>> getCatFacts();

  Future<void> cacheCatFacts(FactsEntity facts);
}

class CatLocalDataSourceImpl implements CatLocalDataSource {
  @override
  Future<Either<String, FactsEntity>> getCatFacts() async {
    try {
      final box = await HiveServices.instance.openBox<FactsModel>('facts');

      final facts = box.get('latest');

      if (facts != null) {
        return Right(facts);
      }

      return Left('No facts found in local storage');
    } catch (e) {
      return Left(e.toString());
    }
  }

  @override
  Future<void> cacheCatFacts(FactsEntity facts) async {
    final box = await HiveServices.instance.openBox<FactsModel>('facts');

    final factsModel = FactsModel(
      fact: facts.fact ?? '',
      length: facts.length ?? 0,
    );

    await box.put('latest', factsModel);
  }
}
