import 'package:cat_app/core/databases/api/api_consumer.dart';
import 'package:cat_app/features/home/data/datasources/cat_remote_data_source.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('loads breeds from every API page', () async {
    final apiConsumer = _FakeApiConsumer({
      1: {
        'last_page': 2,
        'data': [_breed('Abyssinian')],
      },
      2: {
        'last_page': 2,
        'data': [_breed('Bengal')],
      },
    });

    final result = await CatRemoteDataSourceImpl(apiConsumer: apiConsumer)
        .getCatBreeds();

    final breeds = result.fold(
      (failure) => throw StateError(failure.errMessage),
      (breeds) => breeds,
    );
    expect(breeds.map((breed) => breed.breed), ['Abyssinian', 'Bengal']);
    expect(apiConsumer.requestedPages, [1, 2]);
  });

  test('returns a failure for an invalid breeds response', () async {
    final apiConsumer = _FakeApiConsumer({
      1: {'last_page': 1, 'data': 'not a list'},
    });

    final result = await CatRemoteDataSourceImpl(apiConsumer: apiConsumer)
        .getCatBreeds();

    expect(result.isLeft(), isTrue);
    expect(
      result.fold((failure) => failure.errMessage, (_) => ''),
      contains('Invalid cat breeds response'),
    );
  });
}

Map<String, dynamic> _breed(String name) => {
  'breed': name,
  'country': 'Test country',
  'origin': 'Test origin',
  'coat': 'Short',
  'pattern': 'Solid',
};

class _FakeApiConsumer extends ApiConsumer {
  _FakeApiConsumer(this.responses);

  final Map<int, Map<String, dynamic>> responses;
  final requestedPages = <int>[];

  @override
  Future<dynamic> get(
    String path, {
    Object? data,
    Map<String, dynamic>? queryParameters,
  }) async {
    final page = queryParameters?['page'] as int;
    requestedPages.add(page);
    return responses[page]!;
  }

  @override
  Future<dynamic> delete(
    String path, {
    Object? data,
    Map<String, dynamic>? queryParameters,
  }) async {
    throw UnimplementedError();
  }

  @override
  Future<dynamic> patch(
    String path, {
    data,
    Map<String, dynamic>? queryParameters,
    bool isFormData = false,
  }) async {
    throw UnimplementedError();
  }

  @override
  Future<dynamic> post(
    String path, {
    data,
    Map<String, dynamic>? queryParameters,
    bool isFormData = false,
  }) async {
    throw UnimplementedError();
  }
}
