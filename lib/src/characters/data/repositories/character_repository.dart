import 'package:rick_and_morty_app/src/characters/domain/models/character.dart';
import 'package:rick_and_morty_app/src/core/core.dart';
import 'package:rick_and_morty_app/src/core/domain/models/paginated_data.dart';

class CharacterRepository {
  CharacterRepository({required RickAndMortyApiRepository repository})
      : _repository = repository;

  Future<PaginatedData<Character>> getAll() {
    return _repository.getAll(
      endpoint: ApiEndpoints.character.path,
      parserFn: Character.fromJson,
    );
  }

  Future<Character> getOne(String id) {
    return _repository.getOne(
      id: id,
      endpoint: ApiEndpoints.character.path,
      parserFn: Character.fromJson,
    );
  }

  final RickAndMortyApiRepository _repository;
}
