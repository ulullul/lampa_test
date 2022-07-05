import 'package:json_annotation/json_annotation.dart';
import 'package:rnm_t/domain/entities/character/character_location.dart';

part 'character.g.dart';

@JsonSerializable()
class Character {
  final int id;
  final String image;
  final String name;
  final String status;
  final String species;
  final String type;
  final String gender;
  final DateTime? created;
  final CharacterLocation location;

  const Character({
    required this.image,
    required this.id,
    required this.name,
    required this.species,
    required this.status,
    required this.type,
    required this.gender,
    required this.created,
    required this.location,
  });

  factory Character.fromJson(Map<String, dynamic> json) =>
      _$CharacterFromJson(json);

  Map<String, dynamic> toJson() => _$CharacterToJson(this);
}
