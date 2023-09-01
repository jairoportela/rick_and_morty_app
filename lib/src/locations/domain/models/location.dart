import 'package:json_annotation/json_annotation.dart';

part 'location.g.dart';

@JsonSerializable()
class Location {
  const Location({
    required this.id,
    required this.dimension,
    required this.name,
    required this.type,
  });
  final int id;
  final String name, type, dimension;

  factory Location.fromJson(Map<String, dynamic> json) =>
      _$LocationFromJson(json);
}
