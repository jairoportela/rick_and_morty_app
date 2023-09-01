import 'package:json_annotation/json_annotation.dart';

part 'character.g.dart';

@JsonSerializable(createToJson: false)
class Character {
  const Character({
    required this.id,
    required this.gender,
    required this.image,
    required this.name,
    required this.species,
    required this.status,
    required this.type,
  });
  final int id;
  final String name, species, type, image;
  final CharacterStatus status;
  final CharacterGender gender;

  factory Character.fromJson(Map<String, dynamic> json) =>
      _$CharacterFromJson(json);
}

@JsonEnum(valueField: 'name')
enum CharacterStatus {
  alive('Alive'),
  dead('Dead'),
  unknown('unknown');

  const CharacterStatus(this.name);
  final String name;
}

@JsonEnum(valueField: 'name')
enum CharacterGender {
  female('Female'),
  male('Male'),
  genderless('Genderless'),
  unknown('unknown');

  const CharacterGender(this.name);
  final String name;
}
