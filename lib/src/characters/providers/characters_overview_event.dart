part of 'characters_overview_bloc.dart';

sealed class CharactersOverviewEvent extends Equatable {
  const CharactersOverviewEvent();

  @override
  List<Object> get props => [];
}

class GetCharactersData extends CharactersOverviewEvent {
  const GetCharactersData({this.filters, required this.page});
  final int page;
  final CharacterFilters? filters;
}
