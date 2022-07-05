import 'package:rnm_t/data/provider/prefs_provider.dart';
import 'package:rnm_t/domain/entities/character/character.dart';

class FavouritesService {
  final _kFavouritesKey = 'favourites';
  final PrefsProvider _provider;
  const FavouritesService(this._provider);

  Future<List<Character>?> getAll() async {
    final data = await _provider.getList(_kFavouritesKey);
    if (data == null || data.isEmpty) return null;

    return data.map<Character>((json) => Character.fromJson(json)).toList();
  }

  void addFavourite(Character character) async {
    final data = await getAll();
    var dataToWrite = <Character>[];
    if (data == null) {
      dataToWrite.add(character);
    } else {
      dataToWrite = [...data, character];
    }
    _provider.writeList(_kFavouritesKey, dataToWrite);
  }

  void removeFavourite(int id) async {
    final data = await getAll();
    var dataToWrite = <Character>[];
    if (data == null) return;
    dataToWrite = data.where((element) => element.id != id).toList();
    _provider.writeList(_kFavouritesKey, dataToWrite);
  }
}
