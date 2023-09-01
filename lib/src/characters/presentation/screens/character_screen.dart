import 'package:flutter/material.dart';
import 'package:rick_and_morty_app/src/characters/domain/models/character.dart';
import 'package:rick_and_morty_app/src/characters/presentation/widgets/character_status.dart';
import 'package:rick_and_morty_app/src/core/presentation/widgets/info_listtile_widget.dart';
import 'package:rick_and_morty_app/src/core/presentation/widgets/separators.dart';

class CharacterDetailPage extends StatelessWidget {
  const CharacterDetailPage({
    super.key,
    required this.item,
    required this.id,
  });
  final Character item;
  final String id;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(item.name),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Hero(
                tag: 'character_$id',
                child: Image.network(item.image, fit: BoxFit.fill)),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InfoListTile(
                    title: 'Name',
                    info: Text(item.name),
                  ),
                  const VerticalSeparator(
                    value: 5,
                  ),
                  InfoListTile(
                    title: 'Status',
                    info: CharacterStatusWidget(status: item.status),
                  ),
                  const VerticalSeparator(
                    value: 5,
                  ),
                  InfoListTile(
                    title: 'Species',
                    info: Text(item.species),
                  ),
                  const VerticalSeparator(
                    value: 5,
                  ),
                  InfoListTile(
                    info: Text(item.gender.name),
                    title: 'Gender',
                  ),
                  const VerticalSeparator(
                    value: 5,
                  ),
                  if (item.type.isNotEmpty)
                    InfoListTile(
                      info: Text(item.type),
                      title: 'Type',
                    )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
