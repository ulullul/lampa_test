import 'package:dio/dio.dart';
import 'package:rnm_t/core/params/add_favourite_params.dart';
import 'package:rnm_t/core/params/character_request_params.dart';
import 'package:rnm_t/core/params/remove_favourite_params.dart';
import 'package:rnm_t/data/datasources/character_api_service.dart';
import 'package:rnm_t/data/datasources/favourites_service.dart';
import 'package:rnm_t/domain/entities/character/character.dart';
import 'package:rnm_t/domain/entities/character/character_pagination.dart';
import 'package:rnm_t/domain/repositories/character_repository.dart';

class CharacterRepositoryImpl implements CharacterRepository {
  final CharacterApiService _characterApiService;
  final FavouritesService _favouritesService;

  const CharacterRepositoryImpl(
      this._characterApiService, this._favouritesService);

  @override
  Future<CharacterPagination> getCharacters(
      CharacterRequestParams? params) async {
    try {
      final res = await _characterApiService.getCharacters(
        page: params?.page,
        search: params?.search,
      );
      return res.data;
    } on DioError catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<Character>?> getAllFavourites() async {
    try {
      return await _favouritesService.getAll();
    } catch (e) {
      rethrow;
    }
  }

  @override
  void addFavourite(AddFavouriteParams params) {
    try {
      _favouritesService.addFavourite(params.character);
    } catch (e) {
      rethrow;
    }
  }

  @override
  void removeFavourite(RemoveFavouriteParams params) {
    try {
      _favouritesService.removeFavourite(params.id);
    } catch (e) {
      rethrow;
    }
  }
}
