import 'package:rick_and_morty_app/src/core/core.dart';
import 'package:rick_and_morty_app/src/core/domain/models/paginated_data.dart';
import 'package:rick_and_morty_app/src/locations/domain/models/location.dart';

class LocationRepository {
  LocationRepository({required RickAndMortyApiRepository repository})
      : _repository = repository;

  Future<PaginatedData<Location>> getAll() {
    return _repository.getAll(
      endpoint: ApiEndpoints.location.path,
      parserFn: Location.fromJson,
    );
  }

  final RickAndMortyApiRepository _repository;
}
