// "breed": "Abyssinian",
// "country": "Ethiopia",
// "origin": "Natural/Standard",
// "coat": "Short",
// "pattern": "Ticked"

import 'package:cat_app/features/home/domain/entities/breed_entity.dart';
import 'package:hive_ce_flutter/hive_ce_flutter.dart';
import 'package:json_annotation/json_annotation.dart';

part 'breed_model.g.dart';

@HiveType(typeId: 1)
@JsonSerializable()
class BreedModel implements BreedEntity {
  @HiveField(0)
  @JsonKey(name: 'breed')
  @override
  final String breed;
  @HiveField(1)
  @JsonKey(name: 'country')
  @override
  final String country;
  @HiveField(2)
  @JsonKey(name: 'origin')
  @override
  final String origin;
  @HiveField(3)
  @JsonKey(name: 'coat')
  @override
  final String coat;
  @HiveField(4)
  @JsonKey(name: 'pattern')
  @override
  final String pattern;

  BreedModel({
    required this.breed,
    required this.country,
    required this.origin,
    required this.coat,
    required this.pattern,
  });

  factory BreedModel.fromJson(Map<String, dynamic> json) =>
      _$BreedModelFromJson(json);
  Map<String, dynamic> toJson() => _$BreedModelToJson(this);
}
