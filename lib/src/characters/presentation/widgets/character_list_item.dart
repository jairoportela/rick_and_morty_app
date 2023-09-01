import 'package:flutter/material.dart';

class CharacterListItem extends StatelessWidget {
  const CharacterListItem({
    super.key,
    required this.imageUrl,
    required this.name,
    required this.status,
    required this.id,
  });
  final String imageUrl;
  final String name;
  final String status;
  final String id;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {},
      leading: Hero(
        tag: 'character_$id',
        child: CircleAvatar(
          backgroundImage: NetworkImage(imageUrl),
        ),
      ),
      title: Text(name),
      trailing: Chip(label: Text(status)),
    );
  }
}
