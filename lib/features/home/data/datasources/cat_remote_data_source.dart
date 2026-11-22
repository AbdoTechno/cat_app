import 'package:cat_app/core/databases/api/api_constants.dart';
import 'package:cat_app/core/databases/api/api_consumer.dart';
import 'package:cat_app/core/errors/expentions.dart';
import 'package:cat_app/core/errors/failure.dart';
import 'package:cat_app/features/home/data/models/breed_model.dart';
import 'package:cat_app/features/home/data/models/facts_model.dart';
import 'package:dartz/dartz.dart';

abstract class CatRemoteDataSource {
  Future<Either<Failure, FactsModel>> getCatFacts();
  Future<Either<Failure, List<BreedModel>>> getCatBreeds();
}

class CatRemoteDataSourceImpl implements CatRemoteDataSource {
  final ApiConsumer apiConsumer;

  CatRemoteDataSourceImpl({required this.apiConsumer});

  @override
  Future<Either<Failure, FactsModel>> getCatFacts() async {
    try {
      final response = await apiConsumer.get(ApiConstants.factEndpoint);
      final json = _asJsonMap(response, 'Fact');
      if (json['fact'] is! String || json['length'] is! int) {
        throw const FormatException('Fact fields have invalid types.');
      }
      return Right(FactsModel.fromJson(json));
    } on ServerException catch (e) {
      return Left(Failure(errMessage: e.errorModel.errorMessage));
    } on FormatException catch (e) {
      return Left(
        Failure(errMessage: 'Invalid cat fact response: ${e.message}'),
      );
    }
  }

  @override
  Future<Either<Failure, List<BreedModel>>> getCatBreeds() async {
    try {
      var page = 1;
      var lastPage = 1;
      final breeds = <BreedModel>[];

      do {
        final response = await apiConsumer.get(
          ApiConstants.breedEndpoint,
          queryParameters: {'page': page},
        );
        final pageJson = _asJsonMap(response, 'Breeds page');
        final pageData = pageJson['data'];
        if (pageData is! List) {
          throw const FormatException('The data field must be a list.');
        }

        for (final item in pageData) {
          final breedJson = _asJsonMap(item, 'Breed');
          const fields = ['breed', 'country', 'origin', 'coat', 'pattern'];
          if (fields.any((field) => breedJson[field] is! String)) {
            throw const FormatException('Breed fields have invalid types.');
          }
          breeds.add(BreedModel.fromJson(breedJson));
        }

        final responseLastPage = pageJson['last_page'];
        if (responseLastPage is! int || responseLastPage < 1) {
          throw const FormatException('Invalid pagination metadata.');
        }
        lastPage = responseLastPage;
        page++;
      } while (page <= lastPage);

      return Right(breeds);
    } on ServerException catch (e) {
      return Left(Failure(errMessage: e.errorModel.errorMessage));
    } on FormatException catch (e) {
      return Left(
        Failure(errMessage: 'Invalid cat breeds response: ${e.message}'),
      );
    }
  }

  Map<String, dynamic> _asJsonMap(Object? value, String fieldName) {
    if (value is Map<String, dynamic>) {
      return value;
    }
    if (value is Map && value.keys.every((key) => key is String)) {
      return Map<String, dynamic>.from(value);
    }
    throw FormatException('$fieldName must be a JSON object.');
  }
}
