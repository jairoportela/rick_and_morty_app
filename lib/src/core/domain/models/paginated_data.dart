/// Represents paginated data returned from an API request.
class PaginatedData<T> {
  /// Creates an instance of [PaginatedData].
  ///
  /// [data]: List of items in the current page.
  /// [pages]: Total number of available pages.
  /// [total]: Total number of items across all pages.
  /// [hasMore]: Indicates whether there are more pages available.
  const PaginatedData({
    required this.data,
    required this.pages,
    required this.total,
    required this.hasMore,
  });

  /// List of items in the current page.
  final List<T> data;

  /// Total number of available pages.
  final int pages;

  /// Indicates whether there are more pages available.
  final bool hasMore;

  /// Total number of items across all pages.
  final int total;

  /// Returns a string representation of the [PaginatedData] instance.
  @override
  String toString() {
    return '$T Pages: $pages, Total: $total, Has more: $hasMore';
  }
}
