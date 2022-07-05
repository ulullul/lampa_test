import 'package:rnm_t/core/params/character_request_params.dart';
import 'package:rnm_t/core/usecase/usecase.dart';
import 'package:rnm_t/domain/entities/character/character_pagination.dart';
import 'package:rnm_t/domain/repositories/character_repository.dart';

class GetCharacterUseCase
    implements UseCase<CharacterPagination, CharacterRequestParams> {
  final CharacterRepository _characterRepository;

  GetCharacterUseCase(this._characterRepository);

  @override
  Future<CharacterPagination> call({
    CharacterRequestParams? params,
  }) {
    return _characterRepository.getCharacters(params);
  }
}
