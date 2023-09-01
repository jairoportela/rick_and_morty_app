part of 'episodes_overview_bloc.dart';

sealed class EpisodesOverviewEvent extends Equatable {
  const EpisodesOverviewEvent();

  @override
  List<Object?> get props => [];
}

class GetEpisodesData extends EpisodesOverviewEvent {
  const GetEpisodesData({this.filters, required this.page});
  final int page;
  final EpisodesFilters? filters;

  @override
  List<Object?> get props => [page, filters];
}
