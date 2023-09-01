import 'package:rick_and_morty_app/src/core/domain/models/paginated_data.dart';

abstract class RestApiRepository {
  const RestApiRepository();
  Future<PaginatedData<T>> getAll<T>({
    required String endpoint,
    required T Function(Map<String, dynamic> json) parserFn,
    Map<String, dynamic> queryParams = const {},
  });
  Future<T> getOne<T>({
    required String id,
    required String endpoint,
    required T Function(Map<String, dynamic> json) parserFn,
  });
}
