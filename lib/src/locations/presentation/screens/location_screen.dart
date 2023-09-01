import 'package:flutter/material.dart';
import 'package:rick_and_morty_app/src/core/presentation/widgets/info_listtile_widget.dart';
import 'package:rick_and_morty_app/src/core/presentation/widgets/separators.dart';
import 'package:rick_and_morty_app/src/locations/domain/models/location.dart';

class LocationDetailScreen extends StatelessWidget {
  const LocationDetailScreen({
    required this.item,
    super.key,
  });
  final Location item;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          item.name,
          maxLines: 2,
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            InfoListTile(
              title: 'Location Name',
              info: Text(item.name),
            ),
            const VerticalSeparator(
              value: 5,
            ),
            InfoListTile(
              title: 'Dimension',
              info: Text(item.dimension),
            ),
            const VerticalSeparator(
              value: 5,
            ),
            InfoListTile(
              title: 'Type',
              info: Text(item.type),
            ),
          ],
        ),
      ),
    );
  }
}
