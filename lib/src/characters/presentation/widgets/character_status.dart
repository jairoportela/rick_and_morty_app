import 'package:flutter/material.dart';
import 'package:rick_and_morty_app/src/characters/domain/models/character.dart';

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
