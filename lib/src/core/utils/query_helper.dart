/// Abstract base class for query helper.
///
/// Represents data that can be used as query parameters in requests.
abstract class QueryHelper {
  /// Creates a new instance of [QueryHelper].
  const QueryHelper();

  /// Converts the query helper  to a map of query parameters.
  Map<String, dynamic> toQueryParams();

  /// Creates a copy of the query helper with updated properties.
  QueryHelper copyWith();
}
