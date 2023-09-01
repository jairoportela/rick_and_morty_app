import 'package:json_annotation/json_annotation.dart';

part 'episode.g.dart';

@JsonSerializable(createToJson: false)
class Episode {
  const Episode({
    required this.id,
    required this.name,
    required this.airDate,
    required this.episode,
  });
  final int id;
  final String name, episode;
  @JsonKey(name: 'air_date')
  final String airDate;

  factory Episode.fromJson(Map<String, dynamic> json) =>
      _$EpisodeFromJson(json);
}
