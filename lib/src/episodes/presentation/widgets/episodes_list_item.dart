import 'package:flutter/material.dart';

class EpisodeListItem extends StatelessWidget {
  const EpisodeListItem({
    super.key,
    required this.name,
    required this.episodeCode,
    required this.id,
  });

  final String name;
  final String episodeCode;
  final String id;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {},
      title: Text(name),
      trailing: Chip(label: Text(episodeCode)),
    );
  }
}
