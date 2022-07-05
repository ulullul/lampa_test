import 'package:rnm_t/core/params/remove_favourite_params.dart';
import 'package:rnm_t/core/usecase/required_use_case.dart';
import 'package:rnm_t/domain/repositories/character_repository.dart';

class RemoveFavouriteUseCase
    implements RequiredUseCase<void, RemoveFavouriteParams> {
  final CharacterRepository _characterRepository;

  RemoveFavouriteUseCase(this._characterRepository);

  @override
  Future<void> call({
    required RemoveFavouriteParams params,
  }) async {
    return _characterRepository.removeFavourite(params);
  }
}
