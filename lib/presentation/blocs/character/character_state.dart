part of 'character_bloc.dart';

class CharacterState {
  final List<Character>? items;
  final dynamic error;
  final int? nextPageKey;
  final String? search;

  const CharacterState({
    this.items,
    this.nextPageKey,
    this.error,
    this.search,
  });
}

class CharacterInitial extends CharacterState {
  const CharacterInitial()
      : super(
          items: const [],
          error: null,
          nextPageKey: 1,
          search: '',
        );
}
