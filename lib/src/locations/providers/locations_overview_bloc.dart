import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:rick_and_morty_app/src/core/domain/models/exceptions/api_exceptions.dart';
import 'package:rick_and_morty_app/src/core/utils/status_enum.dart';
import 'package:rick_and_morty_app/src/locations/data/repositories/location_repository.dart';
import 'package:rick_and_morty_app/src/locations/domain/models/location.dart';
import 'package:rick_and_morty_app/src/locations/domain/models/locations_filter.dart';

part 'locations_overview_event.dart';
part 'locations_overview_state.dart';

typedef _Emitter = Emitter<LocationsOverviewState>;

class LocationsOverviewBloc
    extends Bloc<LocationsOverviewEvent, LocationsOverviewState> {
  LocationsOverviewBloc({required LocationRepository repository})
      : _repository = repository,
        super(LocationsOverviewState.empty) {
    on<GetLocationsData>(_onGetData);
  }

  void _onGetData(GetLocationsData event, _Emitter emit) async {
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

  final LocationRepository _repository;
}
