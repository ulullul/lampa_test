part of 'favourites_bloc.dart';

abstract class FavouritesEvent {
  const FavouritesEvent();
}

class GetAllFavourites extends FavouritesEvent {
  const GetAllFavourites();
}

class AddFavourite extends FavouritesEvent {
  final Character character;
  const AddFavourite({required this.character});
}

class RemoveFavourite extends FavouritesEvent {
  final int id;
  const RemoveFavourite({required this.id});
}
