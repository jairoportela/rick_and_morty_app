import 'package:rick_and_morty_app/src/core/utils/query_helper.dart';

class EpisodesFilters extends QueryHelper {
  const EpisodesFilters({
    this.searchName,
  });
  final String? searchName;

  @override
  EpisodesFilters copyWith({
    String? Function()? searchName,
  }) {
    return EpisodesFilters(
      searchName: searchName != null ? searchName() : this.searchName,
    );
  }

  @override
  Map<String, dynamic> toQueryParams() {
    final filters = <String, dynamic>{};

    if (searchName != null && searchName!.isNotEmpty) {
      filters['name'] = searchName;
    }
    return filters;
  }

  @override
  List<Object?> get props => [
        searchName,
      ];
}
