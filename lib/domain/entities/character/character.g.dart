// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'character.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Character _$CharacterFromJson(Map<String, dynamic> json) => Character(
      image: json['image'] as String,
      id: json['id'] as int,
      name: json['name'] as String,
      species: json['species'] as String,
      status: json['status'] as String,
      type: json['type'] as String,
      gender: json['gender'] as String,
      created: json['created'] == null
          ? null
          : DateTime.parse(json['created'] as String),
      location:
          CharacterLocation.fromJson(json['location'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CharacterToJson(Character instance) => <String, dynamic>{
      'id': instance.id,
      'image': instance.image,
      'name': instance.name,
      'status': instance.status,
      'species': instance.species,
      'type': instance.type,
      'gender': instance.gender,
      'created': instance.created?.toIso8601String(),
      'location': instance.location,
    };
