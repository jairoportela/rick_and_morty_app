import 'package:rick_and_morty_app/src/characters/domain/models/character.dart';
import 'package:rick_and_morty_app/src/characters/domain/models/character_filter.dart';
import 'package:rick_and_morty_app/src/core/core.dart';
import 'package:rick_and_morty_app/src/core/domain/models/paginated_data.dart';

class CharacterRepository {
  CharacterRepository({required RickAndMortyApiRepository repository})
      : _repository = repository;

  Future<PaginatedData<Character>> getAll({
    required int page,
    required CharacterFilters filters,
  }) {
    return _repository.getAll(
        endpoint: ApiEndpoints.character.path,
        parserFn: Character.fromJson,
        queryParams: {...filters.toQueryParams(), 'page': page.toString()});
  }

  final RickAndMortyApiRepository _repository;
}
