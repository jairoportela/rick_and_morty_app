import 'package:rick_and_morty_app/src/characters/domain/models/character.dart';
import 'package:rick_and_morty_app/src/core/utils/query_helper.dart';

class CharacterFilters extends QueryHelper {
  const CharacterFilters({
    this.gender,
    this.searchName,
    this.status,
  });
  final String? searchName;
  final CharacterGender? gender;
  final CharacterStatus? status;

  @override
  CharacterFilters copyWith({
    String? Function()? searchName,
    CharacterGender? Function()? gender,
    CharacterStatus? Function()? status,
  }) {
    return CharacterFilters(
      searchName: searchName != null ? searchName() : this.searchName,
      gender: gender != null ? gender() : this.gender,
      status: status != null ? status() : this.status,
    );
  }

  @override
  Map<String, dynamic> toQueryParams() {
    final filters = <String, dynamic>{};
    if (gender != null) filters['gender'] = gender!.name;
    if (status != null) filters['status'] = status!.name;
    if (searchName != null && searchName!.isNotEmpty) {
      filters['name'] = searchName;
    }
    return filters;
  }

  @override
  List<Object?> get props => [searchName, gender, status];
}
