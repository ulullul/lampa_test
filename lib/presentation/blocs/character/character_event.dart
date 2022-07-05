part of 'character_bloc.dart';

abstract class CharacterEvent {
  const CharacterEvent();
}

class GetCharacters extends CharacterEvent {
  const GetCharacters();
}

class SearchCharacter extends CharacterEvent {
  final String text;
  const SearchCharacter({required this.text});
}

class ClearSearchCharacter extends CharacterEvent {
  const ClearSearchCharacter();
}
