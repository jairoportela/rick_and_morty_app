part of 'locations_overview_bloc.dart';

class LocationsOverviewState extends Equatable {
  const LocationsOverviewState(
      {required this.hasMore,
      required this.filters,
      required this.items,
      required this.nextPage,
      required this.status,
      this.error});

  final bool hasMore;
  final int nextPage;
  final List<Location> items;
  final RequestStatus status;
  final LocationsFilters filters;
  final String? error;

  LocationsOverviewState copyWith({
    bool? hasMore,
    int? nextPage,
    List<Location>? items,
    RequestStatus? status,
    LocationsFilters? filters,
  }) {
    return LocationsOverviewState(
      hasMore: hasMore ?? this.hasMore,
      filters: filters ?? this.filters,
      items: items ?? this.items,
      nextPage: nextPage ?? this.nextPage,
      status: status ?? this.status,
    );
  }

  LocationsOverviewState copyWithError(
    String message,
  ) {
    return LocationsOverviewState(
      hasMore: hasMore,
      filters: filters,
      items: items,
      nextPage: nextPage,
      status: RequestStatus.failed,
      error: message,
    );
  }

  static const empty = LocationsOverviewState(
    hasMore: true,
    filters: LocationsFilters(),
    items: [],
    nextPage: 1,
    status: RequestStatus.notSubmited,
  );

  @override
  List<Object?> get props => [hasMore, nextPage, items, status, filters, error];
}
