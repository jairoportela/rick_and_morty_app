import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:rick_and_morty_app/src/characters/data/repositories/character_repository.dart';
import 'package:rick_and_morty_app/src/characters/domain/models/character.dart';
import 'package:rick_and_morty_app/src/characters/domain/models/character_filter.dart';
import 'package:rick_and_morty_app/src/core/domain/models/exceptions/api_exceptions.dart';
import 'package:rick_and_morty_app/src/core/utils/status_enum.dart';

part 'characters_overview_event.dart';
part 'characters_overview_state.dart';

typedef _Emitter = Emitter<CharactersOverviewState>;

class CharactersOverviewBloc
    extends Bloc<CharactersOverviewEvent, CharactersOverviewState> {
  CharactersOverviewBloc({required CharacterRepository repository})
      : _repository = repository,
        super(CharactersOverviewState.empty) {
    on<GetCharactersData>(_onGetData);
  }

  void _onGetData(GetCharactersData event, _Emitter emit) async {
    final page = event.page;
    final queryData = event.filters ?? state.filters;
    try {
      final lastItems = page == 1 ? [] : [...state.items];
      emit(
        state.copyWith(
          status: RequestStatus.loading,
          items: page == 1 ? [] : null,
        ),
      );

      final result = await _repository.getAll(
        filters: queryData,
        page: page,
      );

      emit(
        state.copyWith(
          status: RequestStatus.success,
          items: [...lastItems, ...result.data],
          nextPage: page + 1,
          hasMore: result.hasMore,
          filters: queryData,
        ),
      );
    } on ApiException catch (error) {
      emit(
        state.copyWithError(error.message),
      );
    }
  }

  final CharacterRepository _repository;
}
