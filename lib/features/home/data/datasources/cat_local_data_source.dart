import 'package:cat_app/features/home/domain/entities/facts_entity.dart';

abstract class CatLocalDataSource {
  Future<FactsEntity> getCatFacts();
}

class CatLocalDataSourceImpl implements CatLocalDataSource {
  @override
  Future<FactsEntity> getCatFacts() async {
    return FactsEntity(fact: "Cats are great companions.", length: 27);
  }
}
