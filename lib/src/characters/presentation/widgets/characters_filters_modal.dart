import 'package:flutter/material.dart';
import 'package:rick_and_morty_app/src/characters/domain/models/character.dart';
import 'package:rick_and_morty_app/src/characters/domain/models/character_filter.dart';

class CharactersFilterModal extends StatefulWidget {
  const CharactersFilterModal({super.key, required this.initialFilters});
  final CharacterFilters initialFilters;

  @override
  State<CharactersFilterModal> createState() => _CharactersFilterModalState();
}

class _CharactersFilterModalState extends State<CharactersFilterModal> {
  late CharacterFilters _filters;

  @override
  void initState() {
    _filters = widget.initialFilters;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text('Characters Filters'),
              TextFormField(
                initialValue: _filters.searchName,
                onChanged: (search) {
                  setState(() {
                    _filters = _filters.copyWith(searchName: () => search);
                  });
                },
              ),
              DropdownButtonFormField(
                  value: _filters.gender,
                  items: CharacterGender.values
                      .map(
                        (e) => DropdownMenuItem(
                          value: e,
                          child: Text(e.name),
                        ),
                      )
                      .toList(),
                  onChanged: (selected) {
                    if (selected == null) return;
                    setState(() {
                      _filters = _filters.copyWith(gender: () => selected);
                    });
                  }),
              DropdownButtonFormField(
                  value: _filters.status,
                  items: CharacterStatus.values
                      .map(
                        (e) => DropdownMenuItem(
                          value: e,
                          child: Text(e.name),
                        ),
                      )
                      .toList(),
                  onChanged: (selected) {
                    if (selected == null) return;
                    setState(() {
                      _filters = _filters.copyWith(status: () => selected);
                    });
                  }),
              ElevatedButton(
                onPressed: () => Navigator.pop(context,
                    widget.initialFilters != _filters ? _filters : null),
                child: const Text('Filter'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
