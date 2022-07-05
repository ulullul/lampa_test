import 'package:json_annotation/json_annotation.dart';

part 'character_location.g.dart';

@JsonSerializable()
class CharacterLocation {
  final String name;

  const CharacterLocation({required this.name});

  factory CharacterLocation.fromJson(Map<String, dynamic> json) =>
      _$CharacterLocationFromJson(json);

  Map<String, dynamic> toJson() => _$CharacterLocationToJson(this);
}
