// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'breed_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class BreedModelAdapter extends TypeAdapter<BreedModel> {
  @override
  final typeId = 1;

  @override
  BreedModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return BreedModel(
      breed: fields[0] as String,
      country: fields[1] as String,
      origin: fields[2] as String,
      coat: fields[3] as String,
      pattern: fields[4] as String,
    );
  }

  @override
  void write(BinaryWriter writer, BreedModel obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.breed)
      ..writeByte(1)
      ..write(obj.country)
      ..writeByte(2)
      ..write(obj.origin)
      ..writeByte(3)
      ..write(obj.coat)
      ..writeByte(4)
      ..write(obj.pattern);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BreedModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BreedModel _$BreedModelFromJson(Map<String, dynamic> json) => BreedModel(
  breed: json['breed'] as String,
  country: json['country'] as String,
  origin: json['origin'] as String,
  coat: json['coat'] as String,
  pattern: json['pattern'] as String,
);

Map<String, dynamic> _$BreedModelToJson(BreedModel instance) =>
    <String, dynamic>{
      'breed': instance.breed,
      'country': instance.country,
      'origin': instance.origin,
      'coat': instance.coat,
      'pattern': instance.pattern,
    };
