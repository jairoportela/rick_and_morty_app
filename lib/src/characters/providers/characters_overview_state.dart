part of 'characters_overview_bloc.dart';

class CharactersOverviewState extends Equatable {
  const CharactersOverviewState(
      {required this.hasMore,
      required this.filters,
      required this.items,
      required this.nextPage,
      required this.status,
      this.error});

  final bool hasMore;
  final int nextPage;
  final List<Character> items;
  final RequestStatus status;
  final CharacterFilters filters;
  final String? error;

  CharactersOverviewState copyWith({
    bool? hasMore,
    int? nextPage,
    List<Character>? items,
    RequestStatus? status,
    CharacterFilters? filters,
  }) {
    return CharactersOverviewState(
      hasMore: hasMore ?? this.hasMore,
      filters: filters ?? this.filters,
      items: items ?? this.items,
      nextPage: nextPage ?? this.nextPage,
      status: status ?? this.status,
    );
  }

  CharactersOverviewState copyWithError(
    String message,
  ) {
    return CharactersOverviewState(
      hasMore: hasMore,
      filters: filters,
      items: items,
      nextPage: nextPage,
      status: RequestStatus.failed,
      error: message,
    );
  }

  static const empty = CharactersOverviewState(
    hasMore: true,
    filters: CharacterFilters(),
    items: [],
    nextPage: 1,
    status: RequestStatus.notSubmited,
  );

  @override
  List<Object?> get props => [hasMore, nextPage, items, status, filters, error];
}
