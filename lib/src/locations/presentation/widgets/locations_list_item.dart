import 'package:flutter/material.dart';
import 'package:rick_and_morty_app/src/locations/domain/models/location.dart';
import 'package:rick_and_morty_app/src/locations/presentation/screens/location_screen.dart';

class LocationListItem extends StatelessWidget {
  const LocationListItem(
      {super.key,
      required this.name,
      required this.type,
      required this.id,
      required this.item});

  final String name;
  final String type;
  final String id;
  final Location item;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        name,
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
      subtitle: Text(type),
      leading: const Icon(Icons.location_on),
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (ctx) => LocationDetailScreen(
              item: item,
            ),
          ),
        );
      },
    );
  }
}
