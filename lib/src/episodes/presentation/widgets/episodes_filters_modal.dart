import 'package:flutter/material.dart';
import 'package:rick_and_morty_app/src/core/presentation/widgets/custom_form_field.dart';
import 'package:rick_and_morty_app/src/core/presentation/widgets/custom_modal_sheet.dart';
import 'package:rick_and_morty_app/src/core/presentation/widgets/filter_button.dart';
import 'package:rick_and_morty_app/src/core/presentation/widgets/separators.dart';
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
    return CustomModalBottomSheet(
      title: 'Episodes Filters',
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
        const VerticalSeparator(),
        FilterButton(
          modifyFilter: _filters,
          initialFilter: widget.initialFilters,
        ),
      ],
    );
  }
}
