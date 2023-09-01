import 'package:flutter/material.dart';
import 'package:rick_and_morty_app/src/core/presentation/widgets/custom_form_field.dart';
import 'package:rick_and_morty_app/src/core/presentation/widgets/custom_modal_sheet.dart';
import 'package:rick_and_morty_app/src/core/presentation/widgets/filter_button.dart';
import 'package:rick_and_morty_app/src/core/presentation/widgets/separators.dart';
import 'package:rick_and_morty_app/src/locations/domain/models/locations_filter.dart';

class LocationsFilterModal extends StatefulWidget {
  const LocationsFilterModal({super.key, required this.initialFilters});
  final LocationsFilters initialFilters;

  @override
  State<LocationsFilterModal> createState() => _LocationsFilterModalState();
}

class _LocationsFilterModalState extends State<LocationsFilterModal> {
  late LocationsFilters _filters;

  @override
  void initState() {
    _filters = widget.initialFilters;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CustomModalBottomSheet(
      title: 'Locations Filters',
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
