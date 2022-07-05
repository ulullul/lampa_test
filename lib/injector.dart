import 'package:get_it/get_it.dart';
import 'package:rnm_t/data/datasources/character_api_service.dart';
import 'package:rnm_t/data/datasources/favourites_service.dart';
import 'package:rnm_t/data/provider/api_provider.dart';
import 'package:rnm_t/data/provider/prefs_provider.dart';
import 'package:rnm_t/data/repositories/character_repository.dart';
import 'package:rnm_t/domain/repositories/character_repository.dart';
import 'package:rnm_t/domain/usecases/add_favourite_usecase.dart';
import 'package:rnm_t/domain/usecases/get_all_favourites_usecase.dart';
import 'package:rnm_t/domain/usecases/get_character_usecase.dart';
import 'package:rnm_t/domain/usecases/remove_favourite_usecase.dart';
import 'package:rnm_t/presentation/blocs/character/character_bloc.dart';
import 'package:rnm_t/presentation/blocs/favourites/favourites_bloc.dart';

final injector = GetIt.I;

Future<void> initializeDependencies() async {
  // Data providers
  injector.registerSingleton<ApiProvider>(ApiProvider());
  injector.registerSingleton<PrefsProvider>(
    PrefsProvider(),
  );

  // Dependencies
  injector.registerSingleton<CharacterApiService>(
    CharacterApiService(injector()),
  );
  injector.registerSingleton<FavouritesService>(
    FavouritesService(injector()),
  );

  // Repositories
  injector.registerSingleton<CharacterRepository>(
    CharacterRepositoryImpl(injector(), injector()),
  );

  // UseCases
  injector.registerSingleton<GetCharacterUseCase>(
    GetCharacterUseCase(injector()),
  );
  injector.registerSingleton<GetAllFavouritesUseCase>(
    GetAllFavouritesUseCase(injector()),
  );
  injector.registerSingleton<AddFavouriteUseCase>(
    AddFavouriteUseCase(injector()),
  );
  injector.registerSingleton<RemoveFavouriteUseCase>(
    RemoveFavouriteUseCase(injector()),
  );

  // Blocs
  injector.registerFactory<CharacterBloc>(
    () => CharacterBloc(injector()),
  );
  injector.registerFactory<FavouritesBloc>(
    () => FavouritesBloc(injector(), injector(), injector()),
  );
}
