import 'package:rnm_t/core/params/add_favourite_params.dart';
import 'package:rnm_t/core/params/character_request_params.dart';
import 'package:rnm_t/core/params/remove_favourite_params.dart';
import 'package:rnm_t/domain/entities/character/character.dart';
import 'package:rnm_t/domain/entities/character/character_pagination.dart';

abstract class CharacterRepository {
  // remote
  Future<CharacterPagination> getCharacters(
    CharacterRequestParams? params,
  );

  // local
  Future<List<Character>?> getAllFavourites();
  void addFavourite(AddFavouriteParams params);
  void removeFavourite(RemoveFavouriteParams params);
}
