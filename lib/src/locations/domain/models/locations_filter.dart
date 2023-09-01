import 'package:rick_and_morty_app/src/core/utils/query_helper.dart';

class LocationsFilters extends QueryHelper {
  const LocationsFilters({
    this.searchName,
  });
  final String? searchName;

  @override
  LocationsFilters copyWith({
    String? Function()? searchName,
  }) {
    return LocationsFilters(
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
