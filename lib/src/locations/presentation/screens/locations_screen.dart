import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty_app/src/core/config/routes.dart';
import 'package:rick_and_morty_app/src/locations/domain/models/locations_filter.dart';
import 'package:rick_and_morty_app/src/locations/presentation/widgets/locations_bloc_builder.dart';
import 'package:rick_and_morty_app/src/locations/presentation/widgets/locations_bloc_provider.dart';
import 'package:rick_and_morty_app/src/locations/presentation/widgets/locations_filters_modal.dart';
import 'package:rick_and_morty_app/src/locations/providers/locations_overview_bloc.dart';

class LocationsScreen extends StatelessWidget {
  const LocationsScreen({super.key});
  static const routePath = '/locations';

  @override
  Widget build(BuildContext context) {
    return const LocationsBlocProvider(child: LocationsScreenBuilder());
  }
}

class LocationsScreenBuilder extends StatelessWidget {
  const LocationsScreenBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(ScreensTitles.locations.title),
        actions: [
          IconButton(
              onPressed: () async {
                final result = await showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    builder: (ctx) {
                      return LocationsFilterModal(
                        initialFilters:
                            context.read<LocationsOverviewBloc>().state.filters,
                      );
                    });
                if (!context.mounted) return;
                if (result != null && result is LocationsFilters) {
                  context.read<LocationsOverviewBloc>().add(
                        GetLocationsData(page: 1, filters: result),
                      );
                }
              },
              icon: const Icon(
                Icons.filter_alt,
              ))
        ],
      ),
      body: const SafeArea(
        bottom: false,
        child: LocationsInfiniteList(),
      ),
    );
  }
}
