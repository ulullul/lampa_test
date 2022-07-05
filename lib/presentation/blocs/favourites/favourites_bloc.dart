import 'package:bloc/bloc.dart';
import 'package:rnm_t/core/params/add_favourite_params.dart';
import 'package:rnm_t/core/params/remove_favourite_params.dart';
import 'package:rnm_t/domain/entities/character/character.dart';
import 'package:rnm_t/domain/usecases/add_favourite_usecase.dart';
import 'package:rnm_t/domain/usecases/get_all_favourites_usecase.dart';
import 'package:rnm_t/domain/usecases/remove_favourite_usecase.dart';

part 'favourites_event.dart';
part 'favourites_state.dart';

class FavouritesBloc extends Bloc<FavouritesEvent, FavouritesState> {
  final GetAllFavouritesUseCase _getAllFavouritesUseCase;
  final AddFavouriteUseCase _addFavouriteUseCase;
  final RemoveFavouriteUseCase _removeFavouriteUseCase;

  FavouritesBloc(
    this._getAllFavouritesUseCase,
    this._addFavouriteUseCase,
    this._removeFavouriteUseCase,
  ) : super(FavouritesInitial()) {
    on<GetAllFavourites>(_getAllFavourites);
    on<AddFavourite>(_addFavourite);
    on<RemoveFavourite>(_removeFavourite);
  }

  void _getAllFavourites(
      GetAllFavourites event, Emitter<FavouritesState> emit) async {
    final articles = await _getAllFavouritesUseCase();
    emit(
      FavouritesState(favourites: articles),
    );
  }

  void _addFavourite(AddFavourite event, Emitter<FavouritesState> emit) async {
    _addFavouriteUseCase(
      params: AddFavouriteParams(
        character: event.character,
      ),
    );
    emit(
      FavouritesState(
        favourites: [...state.favourites ?? [], event.character],
      ),
    );
  }

  void _removeFavourite(
      RemoveFavourite event, Emitter<FavouritesState> emit) async {
    _removeFavouriteUseCase(
      params: RemoveFavouriteParams(
        id: event.id,
      ),
    );
    add(const GetAllFavourites());
    /*emit(
      FavouritesState(
        favourites: [...state.favourites ?? [], event.character],
      ),
    );*/
  }
}
