import 'package:flutter/material.dart';
import 'package:rick_and_morty_app/src/characters/domain/models/character.dart';
import 'package:rick_and_morty_app/src/characters/presentation/screens/character_screen.dart';
import 'package:rick_and_morty_app/src/characters/presentation/widgets/character_status.dart';

class CharacterGridItem extends StatelessWidget {
  const CharacterGridItem({
    super.key,
    required this.imageUrl,
    required this.name,
    required this.status,
    required this.id,
    required this.item,
  });
  final Character item;
  final String imageUrl;
  final String name;
  final CharacterStatus status;
  final String id;
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return InkWell(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (ctx) => CharacterDetailScreen(
                item: item,
                id: id,
              ),
            ),
          );
        },
        child: Card(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Hero(
                tag: 'character_$id',
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: const BorderRadius.vertical(
                        top: Radius.circular(10),
                      ),
                      image: DecorationImage(
                        image: NetworkImage(
                          imageUrl,
                        ),
                        fit: BoxFit.fill,
                      )),
                  height: constraints.maxHeight * 2 / 3,
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        name,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      CharacterStatusWidget(
                        status: status,
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
