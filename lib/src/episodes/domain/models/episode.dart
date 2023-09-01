import 'package:json_annotation/json_annotation.dart';

part 'episode.g.dart';

@JsonSerializable()
class Episode {
  const Episode({
    required this.id,
    required this.name,
    required this.airDate,
    required this.episode,
  });
  final int id;
  final String name, airDate, episode;

  factory Episode.fromJson(Map<String, dynamic> json) =>
      _$EpisodeFromJson(json);
}
