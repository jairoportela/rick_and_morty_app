import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:rick_and_morty_app/src/core/utils/query_helper.dart';

class FilterButton extends StatelessWidget {
  const FilterButton({
    super.key,
    required this.modifyFilter,
    required this.initialFilter,
  });
  final QueryHelper modifyFilter;
  final QueryHelper initialFilter;

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      onPressed: () {
        log(modifyFilter.toString(), name: 'modifyFilter');
        log(initialFilter.toString(), name: 'initialFilter');
        log((initialFilter != modifyFilter).toString(), name: 'initialFilter');
        Navigator.pop(
            context, initialFilter != modifyFilter ? modifyFilter : null);
      },
      child: const Text('Filter'),
    );
  }
}
