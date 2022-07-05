import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:rnm_t/core/params/character_request_params.dart';
import 'package:rnm_t/domain/entities/character/character.dart';
import 'package:rnm_t/domain/usecases/get_character_usecase.dart';
import 'package:rnm_t/utils/logger.dart';
import 'package:rxdart/rxdart.dart';

part 'character_event.dart';
part 'character_state.dart';

class CharacterBloc extends Bloc<CharacterEvent, CharacterState> {
  final GetCharacterUseCase _getCharacterUseCase;
  int page = 1;

  final int _pageSize = 20;

  CharacterBloc(this._getCharacterUseCase) : super(const CharacterInitial()) {
    on<GetCharacters>(_getCharacters);
    on<SearchCharacter>(
      _searchChanged,
      transformer: debounceRestartable(
        const Duration(milliseconds: 300),
      ),
    );
    on<ClearSearchCharacter>(_clearSearch);
  }

  EventTransformer<RegistrationEvent> debounceRestartable<RegistrationEvent>(
    Duration duration,
  ) {
    return (events, mapper) => restartable<RegistrationEvent>()
        .call(events.debounceTime(duration), mapper);
  }

  void _clearSearch(CharacterEvent even, Emitter<CharacterState> emit) {
    page = 1;
    emit(
      const CharacterInitial(),
    );
  }

  void _searchChanged(
      SearchCharacter event, Emitter<CharacterState> emit) async {
    page = 1;
    emit(
      CharacterState(
        search: event.text,
        error: null,
        items: [],
        nextPageKey: page,
      ),
    );
  }

  void _getCharacters(
      CharacterEvent event, Emitter<CharacterState> emit) async {
    try {
      final data = await _getCharacterUseCase(
        params: CharacterRequestParams(
          page: page,
          search: state.search,
        ),
      );

      if (data.results != null) {
        final res = data.results;
        final isLastPage = res!.length < _pageSize;
        final nextPageKey = isLastPage ? null : ++page;
        emit(
          CharacterState(
            search: state.search,
            error: null,
            items: [...state.items ?? [], ...res],
            nextPageKey: nextPageKey,
          ),
        );
      }
    } catch (e, stacktrace) {
      logger.e('error', e, stacktrace);
      emit(
        CharacterState(
          error: e,
          search: state.search,
          nextPageKey: state.nextPageKey,
          items: state.items,
        ),
      );
    }
  }
}
