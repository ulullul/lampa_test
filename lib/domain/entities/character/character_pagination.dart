import 'package:json_annotation/json_annotation.dart';

import '../pagination/pagination_info.dart';
import 'character.dart';

@JsonSerializable()
class CharacterPagination {
  final PaginationInfo info;
  final List<Character>? results;

  const CharacterPagination({
    required this.info,
    this.results,
  });
}
