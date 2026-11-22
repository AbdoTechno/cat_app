
import 'package:cat_app/features/home/domain/entities/facts_entity.dart';
import 'package:hive_ce/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'facts_model.g.dart';

@HiveType(typeId: 0)
@JsonSerializable()
class FactsModel extends FactsEntity {
  @HiveField(0)
  @JsonKey(name: 'fact')
  final String fact;

  @HiveField(1)
  @JsonKey(name: 'length')
  final int length;

  FactsModel({
    required this.fact,
    required this.length,
  }) : super(fact: fact, length: length);

  factory FactsModel.fromJson(Map<String, dynamic> json) =>
      _$FactsModelFromJson(json);

  Map<String, dynamic> toJson() => _$FactsModelToJson(this);
}
