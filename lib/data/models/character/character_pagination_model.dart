import 'package:json_annotation/json_annotation.dart';
import 'package:rnm_t/domain/entities/character/character_pagination.dart';

import '../pagination/pagination_info_model.dart';
import 'character_model.dart';

part 'character_pagination_model.g.dart';

@JsonSerializable()
class CharacterPaginationModel extends CharacterPagination {
  const CharacterPaginationModel({
    required PaginationInfoModel info,
    required List<CharacterModel> results,
  }) : super(
          info: info,
          results: results,
        );

  factory CharacterPaginationModel.fromJson(Map<String, dynamic> json) =>
      _$CharacterPaginationModelFromJson(json);

  Map<String, dynamic> toJson() => _$CharacterPaginationModelToJson(this);
}
