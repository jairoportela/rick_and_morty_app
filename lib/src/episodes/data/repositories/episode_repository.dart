import 'package:rick_and_morty_app/src/core/core.dart';
import 'package:rick_and_morty_app/src/core/domain/models/paginated_data.dart';
import 'package:rick_and_morty_app/src/episodes/domain/models/episode.dart';

class EpisodeRepository {
  EpisodeRepository({required RickAndMortyApiRepository repository})
      : _repository = repository;

  Future<PaginatedData<Episode>> getAll() {
    return _repository.getAll(
      endpoint: ApiEndpoints.episode.path,
      parserFn: Episode.fromJson,
    );
  }

  final RickAndMortyApiRepository _repository;
}
