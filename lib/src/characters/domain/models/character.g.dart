// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'character.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Character _$CharacterFromJson(Map<String, dynamic> json) => Character(
      id: json['id'] as int,
      gender: $enumDecode(_$CharacterGenderEnumMap, json['gender']),
      image: json['image'] as String,
      name: json['name'] as String,
      species: json['species'] as String,
      status: $enumDecode(_$CharacterStatusEnumMap, json['status']),
      type: json['type'] as String,
    );

Map<String, dynamic> _$CharacterToJson(Character instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'species': instance.species,
      'type': instance.type,
      'image': instance.image,
      'status': _$CharacterStatusEnumMap[instance.status]!,
      'gender': _$CharacterGenderEnumMap[instance.gender]!,
    };

const _$CharacterGenderEnumMap = {
  CharacterGender.female: 'Female',
  CharacterGender.male: 'Male',
  CharacterGender.genderless: 'Genderless',
  CharacterGender.unknown: 'unknown',
};

const _$CharacterStatusEnumMap = {
  CharacterStatus.alive: 'Alive',
  CharacterStatus.dead: 'Dead',
  CharacterStatus.unknown: 'unknown',
};
