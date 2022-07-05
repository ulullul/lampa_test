// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'character_pagination_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CharacterPaginationModel _$CharacterPaginationModelFromJson(
        Map<String, dynamic> json) =>
    CharacterPaginationModel(
      info: PaginationInfoModel.fromJson(json['info'] as Map<String, dynamic>),
      results: (json['results'] as List<dynamic>)
          .map((e) => CharacterModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CharacterPaginationModelToJson(
        CharacterPaginationModel instance) =>
    <String, dynamic>{
      'info': instance.info,
      'results': instance.results,
    };
