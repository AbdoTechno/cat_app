import 'package:cat_app/core/databases/api/api_constants.dart';
import 'package:cat_app/core/databases/api/dio_service.dart';
import 'package:cat_app/core/errors/expentions.dart';
import 'package:cat_app/core/errors/failure.dart';
import 'package:cat_app/features/home/data/models/facts_model.dart';
import 'package:dartz/dartz.dart';

abstract class CatRemoteDataSource {
  Future<Either<Failure, FactsModel>> getCatFacts();
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
}
