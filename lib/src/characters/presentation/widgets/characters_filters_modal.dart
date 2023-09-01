import 'package:flutter/material.dart';
import 'package:rick_and_morty_app/src/characters/domain/models/character.dart';
import 'package:rick_and_morty_app/src/characters/domain/models/character_filter.dart';
import 'package:rick_and_morty_app/src/core/presentation/widgets/custom_form_field.dart';
import 'package:rick_and_morty_app/src/core/presentation/widgets/custom_modal_sheet.dart';
import 'package:rick_and_morty_app/src/core/presentation/widgets/filter_button.dart';
import 'package:rick_and_morty_app/src/core/presentation/widgets/separators.dart';

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
    return CustomModalBottomSheet(
      title: 'Characters Filters',
      children: [
        CustomFormField(
          title: 'Name',
          formField: CustomTextFormField(
            initialValue: _filters.searchName,
            onChanged: (search) {
              final value = _filters.copyWith(searchName: () => search);
              setState(() {
                _filters = value;
              });
            },
          ),
        ),
        CustomFormField(
          title: 'Gender',
          formField: CustomDropdownField(
              value: _filters.gender,
              items: CharacterGender.values,
              onChanged: (selected) {
                if (selected == null) return;
                final newValue = _filters.copyWith(gender: () => selected);
                setState(() {
                  _filters = newValue;
                });
              }),
        ),
        CustomFormField(
          title: 'Status',
          formField: CustomDropdownField(
              value: _filters.status,
              items: CharacterStatus.values,
              onChanged: (selected) {
                if (selected == null) return;
                final newValue = _filters.copyWith(status: () => selected);
                setState(() {
                  _filters = newValue;
                });
              }),
        ),
        const VerticalSeparator(),
        FilterButton(
          modifyFilter: _filters,
          initialFilter: widget.initialFilters,
        ),
      ],
    );
  }
}
