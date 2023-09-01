import 'package:flutter/material.dart';

class LocationListItem extends StatelessWidget {
  const LocationListItem({
    super.key,
    required this.name,
    required this.type,
    required this.id,
  });

  final String name;
  final String type;
  final String id;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {},
      title: Text(name),
      trailing: Chip(label: Text(type)),
    );
  }
}
