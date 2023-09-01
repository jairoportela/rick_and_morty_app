part of 'episodes_overview_bloc.dart';

class EpisodesOverviewState extends Equatable {
  const EpisodesOverviewState(
      {required this.hasMore,
      required this.filters,
      required this.items,
      required this.nextPage,
      required this.status,
      this.error});

  final bool hasMore;
  final int nextPage;
  final List<Episode> items;
  final RequestStatus status;
  final EpisodesFilters filters;
  final String? error;

  EpisodesOverviewState copyWith({
    bool? hasMore,
    int? nextPage,
    List<Episode>? items,
    RequestStatus? status,
    EpisodesFilters? filters,
  }) {
    return EpisodesOverviewState(
      hasMore: hasMore ?? this.hasMore,
      filters: filters ?? this.filters,
      items: items ?? this.items,
      nextPage: nextPage ?? this.nextPage,
      status: status ?? this.status,
    );
  }

  EpisodesOverviewState copyWithError(
    String message,
  ) {
    return EpisodesOverviewState(
      hasMore: hasMore,
      filters: filters,
      items: items,
      nextPage: nextPage,
      status: RequestStatus.failed,
      error: message,
    );
  }

  static const empty = EpisodesOverviewState(
    hasMore: true,
    filters: EpisodesFilters(),
    items: [],
    nextPage: 1,
    status: RequestStatus.notSubmited,
  );

  @override
  List<Object?> get props => [hasMore, nextPage, items, status, filters, error];
}
