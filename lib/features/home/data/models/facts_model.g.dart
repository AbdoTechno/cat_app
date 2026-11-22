// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'facts_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class FactsModelAdapter extends TypeAdapter<FactsModel> {
  @override
  final typeId = 0;

  @override
  FactsModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return FactsModel(
      fact: fields[0] as String,
      length: (fields[1] as num).toInt(),
    );
  }

  @override
  void write(BinaryWriter writer, FactsModel obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.fact)
      ..writeByte(1)
      ..write(obj.length);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FactsModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FactsModel _$FactsModelFromJson(Map<String, dynamic> json) => FactsModel(
  fact: json['fact'] as String,
  length: (json['length'] as num).toInt(),
);

Map<String, dynamic> _$FactsModelToJson(FactsModel instance) =>
    <String, dynamic>{'fact': instance.fact, 'length': instance.length};
