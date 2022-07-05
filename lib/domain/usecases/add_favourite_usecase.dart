import 'package:rnm_t/core/params/add_favourite_params.dart';
import 'package:rnm_t/core/usecase/required_use_case.dart';
import 'package:rnm_t/domain/repositories/character_repository.dart';

class AddFavouriteUseCase implements RequiredUseCase<void, AddFavouriteParams> {
  final CharacterRepository _characterRepository;

  AddFavouriteUseCase(this._characterRepository);

  @override
  Future<void> call({
    required AddFavouriteParams params,
  }) async {
    return _characterRepository.addFavourite(params);
  }
}
