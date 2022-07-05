import 'package:json_annotation/json_annotation.dart';
import 'package:rnm_t/domain/entities/character/character_location.dart';

part 'character_location_model.g.dart';

@JsonSerializable()
class CharacterLocationModel extends CharacterLocation {
  const CharacterLocationModel({
    required String name,
  }) : super(
          name: name,
        );

  factory CharacterLocationModel.fromJson(Map<String, dynamic> json) =>
      _$CharacterLocationModelFromJson(json);

  Map<String, dynamic> toJson() => _$CharacterLocationModelToJson(this);
}
