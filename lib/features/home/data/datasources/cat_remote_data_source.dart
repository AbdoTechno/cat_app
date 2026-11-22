import 'package:cat_app/core/databases/api/api_constants.dart';
import 'package:cat_app/core/databases/api/dio_service.dart';
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
  final DioService dioService;
  CatRemoteDataSourceImpl({required this.dioService});
  @override
  Future<Either<Failure, FactsModel>> getCatFacts() async {
    try {
      final response = await dioService.get(ApiConstants.factEndpoint);
      return Right(FactsModel.fromJson(response));
    } on ServerException catch (e) {
      return Left(Failure(errMessage: e.errorModel.errorMessage));
    }
  }

  @override
  Future<Either<Failure, List<BreedModel>>> getCatBreeds() async {
    try {
      final response = await dioService.get(ApiConstants.breedEndpoint);
      final breeds = (response['data'] as List<dynamic>)
          .map((breed) => BreedModel.fromJson(breed as Map<String, dynamic>))
          .toList();
      return Right(breeds);
    } on ServerException catch (e) {
      return Left(Failure(errMessage: e.errorModel.errorMessage));
    }
  }
}
