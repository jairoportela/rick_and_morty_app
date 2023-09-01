import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty_app/src/locations/data/repositories/location_repository.dart';
import 'package:rick_and_morty_app/src/locations/providers/locations_overview_bloc.dart';

class LocationsBlocProvider extends StatelessWidget {
  const LocationsBlocProvider({
    super.key,
    required this.child,
  });
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (ctx) => LocationsOverviewBloc(
        repository: RepositoryProvider.of<LocationRepository>(context),
      )..add(
          const GetLocationsData(page: 1),
        ),
      child: child,
    );
  }
}
