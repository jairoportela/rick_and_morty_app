import 'package:flutter/material.dart';
import 'package:rick_and_morty_app/src/core/presentation/widgets/info_listtile_widget.dart';
import 'package:rick_and_morty_app/src/core/presentation/widgets/separators.dart';
import 'package:rick_and_morty_app/src/episodes/domain/models/episode.dart';

class EpisodeDetailScreen extends StatelessWidget {
  const EpisodeDetailScreen({
    required this.item,
    super.key,
  });
  final Episode item;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '${item.name} (${item.episode})',
          maxLines: 2,
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            InfoListTile(
              title: 'Episode Name',
              info: Text(item.name),
            ),
            const VerticalSeparator(
              value: 5,
            ),
            InfoListTile(
              title: 'Episode Number',
              info: Text(item.episode),
            ),
            const VerticalSeparator(
              value: 5,
            ),
            InfoListTile(
              title: 'Air Date',
              info: Text(item.airDate),
            ),
          ],
        ),
      ),
    );
  }
}
