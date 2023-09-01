part of 'locations_overview_bloc.dart';

sealed class LocationsOverviewEvent extends Equatable {
  const LocationsOverviewEvent();

  @override
  List<Object?> get props => [];
}

class GetLocationsData extends LocationsOverviewEvent {
  const GetLocationsData({this.filters, required this.page});
  final int page;
  final LocationsFilters? filters;

  @override
  List<Object?> get props => [page, filters];
}
