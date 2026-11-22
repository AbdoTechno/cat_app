import 'package:cat_app/core/databases/cache/hive_services.dart';
import 'package:cat_app/features/home/data/models/facts_model.dart';
import 'package:cat_app/features/home/data/models/breed_model.dart';
import 'package:cat_app/features/home/domain/entities/breed_entity.dart';
import 'package:cat_app/features/home/domain/entities/facts_entity.dart';
import 'package:dartz/dartz.dart';

abstract class CatLocalDataSource {
  Future<Either<String, FactsEntity>> getCatFacts();
  Future<Either<String, List<BreedEntity>>> getBreedsFacts();
  Future<void> cacheCatFacts(FactsEntity facts);
  Future<void> cacheBreedsFacts(List<BreedEntity> breeds);
}

class CatLocalDataSourceImpl implements CatLocalDataSource {
  static const String _factsBox = 'facts';
  static const String _breedsBox = 'breeds';
  static const String _cacheKey = 'latest';

  @override
  Future<Either<String, FactsEntity>> getCatFacts() async {
    try {
      final box = await HiveServices.instance.openBox<FactsModel>(_factsBox);
      final facts = box.get(_cacheKey);
      if (facts == null) {
        return Left('No facts found in local storage');
      }
      return Right(facts);
    } catch (e) {
      return Left(e.toString());
    }
  }

  @override
  Future<void> cacheCatFacts(FactsEntity facts) async {
    final box = await HiveServices.instance.openBox<FactsModel>(_factsBox);
    final factsModel = FactsModel(
      fact: facts.fact ?? '',
      length: facts.length ?? 0,
    );
    await box.put(_cacheKey, factsModel);
  }

  @override
  Future<Either<String, List<BreedEntity>>> getBreedsFacts() async {
    try {
      final box = await HiveServices.instance.openBox<BreedModel>(_breedsBox);
      final breeds = box.values.toList();
      if (breeds.isEmpty) {
        return Left('No breeds found in local storage');
      }
      return Right(breeds);
    } catch (e) {
      return Left(e.toString());
    }
  }

  @override
  Future<void> cacheBreedsFacts(List<BreedEntity> breeds) async {
    final box = await HiveServices.instance.openBox<BreedModel>(_breedsBox);
    final breedModels = breeds.map((breed) => breed as BreedModel).toList();
    final entries = <int, BreedModel>{
      for (var i = 0; i < breedModels.length; i++) i: breedModels[i],
    };
    await box.clear();
    await box.putAll(entries);
  }
}
