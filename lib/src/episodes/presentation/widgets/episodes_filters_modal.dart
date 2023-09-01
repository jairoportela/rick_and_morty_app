import 'package:flutter/material.dart';
import 'package:rick_and_morty_app/src/episodes/domain/models/episodes_filter.dart';

class EpisodesFilterModal extends StatefulWidget {
  const EpisodesFilterModal({super.key, required this.initialFilters});
  final EpisodesFilters initialFilters;

  @override
  State<EpisodesFilterModal> createState() => _EpisodesFilterModalState();
}

class _EpisodesFilterModalState extends State<EpisodesFilterModal> {
  late EpisodesFilters _filters;

  @override
  void initState() {
    _filters = widget.initialFilters;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: SizedBox(
        height: 300,
        child: Padding(
          padding: const EdgeInsets.all(10).copyWith(bottom: 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text('Episodes Filters'),
              TextFormField(
                initialValue: _filters.searchName,
                onChanged: (search) {
                  final value = _filters.copyWith(searchName: () => search);
                  setState(() {
                    _filters = value;
                  });
                },
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context,
                      widget.initialFilters != _filters ? _filters : null);
                },
                child: const Text('Filter'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}