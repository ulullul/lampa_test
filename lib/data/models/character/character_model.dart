import 'package:json_annotation/json_annotation.dart';
import 'package:rnm_t/data/models/character/character_location_model.dart';
import 'package:rnm_t/domain/entities/character/character.dart';

part 'character_model.g.dart';

@JsonSerializable()
class CharacterModel extends Character {
  const CharacterModel({
    required int id,
    required String image,
    required String name,
    required String status,
    required String species,
    required String type,
    required String gender,
    required DateTime? created,
    required CharacterLocationModel location,
  }) : super(
          id: id,
          image: image,
          name: name,
          status: status,
          species: species,
          type: type,
          gender: gender,
          created: created,
          location: location,
        );

  factory CharacterModel.fromJson(Map<String, dynamic> json) =>
      _$CharacterModelFromJson(json);

  Map<String, dynamic> toJson() => _$CharacterModelToJson(this);
}
