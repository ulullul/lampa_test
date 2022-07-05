import 'package:rnm_t/core/usecase/usecase.dart';
import 'package:rnm_t/domain/entities/character/character.dart';
import 'package:rnm_t/domain/repositories/character_repository.dart';

class GetAllFavouritesUseCase implements UseCase<List<Character>?, void> {
  final CharacterRepository _characterRepository;

  GetAllFavouritesUseCase(this._characterRepository);

  @override
  Future<List<Character>?> call({params}) {
    return _characterRepository.getAllFavourites();
  }
}
