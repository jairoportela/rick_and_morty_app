import 'dart:convert';

import 'package:rick_and_morty_app/src/core/config/environvent.dart';
import 'package:rick_and_morty_app/src/core/domain/models/exceptions/api_exceptions.dart';
import 'package:rick_and_morty_app/src/core/domain/models/paginated_data.dart';
import 'package:rick_and_morty_app/src/core/domain/repositories/rest_api_repository.dart';
import 'package:http/http.dart' as http;

PaginatedData<T> _decodeApi<T>(
  Map<dynamic, dynamic> data,
  T Function(Map<String, dynamic> json) parserFn,
) {
  final info = data['info'] as Map;
  final results = data['results'] as List<Map<String, dynamic>>;
  return PaginatedData<T>(
      data: results.map((result) => parserFn(result)).toList(),
      pages: info['pages'],
      total: info['count'],
      hasMore: info['next'] != null);
}

class RickAndMortyApiRepository extends RestApiRepository {
  @override
  Future<PaginatedData<T>> getAll<T>({
    required String endpoint,
    required T Function(Map<String, dynamic> json) parserFn,
    Map<String, dynamic> queryParams = const {},
  }) async {
    try {
      final uri = Uri.https(_baseUrl, '/api/$endpoint', queryParams);
      final response = await http.get(uri);
      final decodedResponse =
          jsonDecode(utf8.decode(response.bodyBytes)) as Map;
      return _decodeApi(decodedResponse, parserFn);
    } catch (error) {
      throw ApiException('Error getting the resource $endpoint');
    }
  }

  static const String _baseUrl = Environmet.rickAndMortyApiBaseUrl;

  @override
  Future<T> getOne<T>({
    required String id,
    required String endpoint,
    required T Function(Map<String, dynamic> json) parserFn,
  }) async {
    try {
      final uri = Uri.https(_baseUrl, '/api/$endpoint/$id');
      final response = await http.get(uri);
      final decodedResponse =
          jsonDecode(utf8.decode(response.bodyBytes)) as Map<String, dynamic>;
      return parserFn(decodedResponse);
    } catch (error) {
      throw ApiException('Error getting the resource $endpoint/$id');
    }
  }
}
