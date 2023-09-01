import 'package:flutter/material.dart';
import 'package:rick_and_morty_app/src/episodes/domain/models/episode.dart';
import 'package:rick_and_morty_app/src/episodes/presentation/screens/episode_screen.dart';

class EpisodeListItem extends StatelessWidget {
  const EpisodeListItem({
    super.key,
    required this.name,
    required this.episodeCode,
    required this.id,
    required this.item,
  });

  final String name;
  final String episodeCode;
  final String id;
  final Episode item;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        name,
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
      subtitle: Text(episodeCode),
      leading: const Icon(Icons.video_collection),
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (ctx) => EpisodeDetailScreen(
              item: item,
            ),
          ),
        );
      },
    );
  }
}
