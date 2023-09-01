import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:rick_and_morty_app/src/core/domain/models/exceptions/api_exceptions.dart';
import 'package:rick_and_morty_app/src/core/utils/status_enum.dart';
import 'package:rick_and_morty_app/src/episodes/data/repositories/episode_repository.dart';
import 'package:rick_and_morty_app/src/episodes/domain/models/episode.dart';
import 'package:rick_and_morty_app/src/episodes/domain/models/episodes_filter.dart';

part 'episodes_overview_event.dart';
part 'episodes_overview_state.dart';

typedef _Emitter = Emitter<EpisodesOverviewState>;

class EpisodesOverviewBloc
    extends Bloc<EpisodesOverviewEvent, EpisodesOverviewState> {
  EpisodesOverviewBloc({required EpisodeRepository repository})
      : _repository = repository,
        super(EpisodesOverviewState.empty) {
    on<GetEpisodesData>(_onGetData);
  }

  void _onGetData(GetEpisodesData event, _Emitter emit) async {
    final page = event.page;
    final queryData = event.filters ?? state.filters;
    try {
      final lastItems = page == 1 ? [] : [...state.items];
      emit(
        state.copyWith(
          status: RequestStatus.loading,
          items: page == 1 ? [] : null,
          filters: queryData,
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

  final EpisodeRepository _repository;
}
