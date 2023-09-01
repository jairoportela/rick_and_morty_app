import 'package:flutter/material.dart';
import 'package:rick_and_morty_app/src/characters/domain/models/character.dart';

class CharacterGridItem extends StatelessWidget {
  const CharacterGridItem({
    super.key,
    required this.imageUrl,
    required this.name,
    required this.status,
    required this.id,
  });
  final String imageUrl;
  final String name;
  final CharacterStatus status;
  final String id;
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return Card(
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
      );
    });
  }
}

class CharacterStatusWidget extends StatelessWidget {
  const CharacterStatusWidget({required this.status, super.key});
  final CharacterStatus status;

  @override
  Widget build(BuildContext context) {
    Color statusColor;
    String statusText;

    // Determine the color and text based on the status
    switch (status) {
      case CharacterStatus.alive:
        statusColor = Colors.green;
        statusText = "Alive";
        break;
      case CharacterStatus.dead:
        statusColor = Colors.red;
        statusText = "Dead";
        break;
      case CharacterStatus.unknown:
        statusColor = Colors.grey;
        statusText = "Unknown";
        break;
    }

    return Row(
      children: [
        Icon(
          Icons.circle,
          color: statusColor,
          size: 16.0,
        ),
        const SizedBox(width: 8.0),
        Text(
          statusText,
          style: TextStyle(
            color: statusColor,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
