import 'package:envied/envied.dart';

part 'api_constants.g.dart';

@envied
abstract class ApiConstants {
  @EnviedField(varName: 'BASE_URL')
  static const String baseUrl = _ApiConstants.baseUrl;
  @EnviedField(varName: 'FACT_ENDPOINT')
  static const String factEndpoint = _ApiConstants.factEndpoint;
  @EnviedField(varName: 'BREED_ENDPOINT')
  static const String breedEndpoint = _ApiConstants.breedEndpoint;
}
