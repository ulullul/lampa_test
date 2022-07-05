import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rnm_t/presentation/blocs/favourites/favourites_bloc.dart';

class FavouriteButton extends StatelessWidget {
  final VoidCallback onTap;
  final int characterId;
  const FavouriteButton({
    Key? key,
    required this.onTap,
    required this.characterId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavouritesBloc, FavouritesState>(
      builder: (context, state) {
        final favourites =
            state.favourites?.any((element) => element.id == characterId);

        final isPresent = favourites != null && favourites;
        return OutlinedButton(
          onPressed: () {
            isPresent
                ? BlocProvider.of<FavouritesBloc>(context).add(
                    RemoveFavourite(id: characterId),
                  )
                : onTap();
          },
          style: ButtonStyle(
            foregroundColor: MaterialStateProperty.all(
              isPresent ? Colors.black : Colors.white,
            ),
            side: MaterialStateProperty.all(
              const BorderSide(color: Colors.black),
            ),
            backgroundColor: MaterialStateProperty.all(
              isPresent ? Colors.black : Colors.white,
            ),
          ),
          child: Text(
            isPresent ? 'Remove from favourites' : 'Add to favourite',
            style: Theme.of(context).textTheme.bodySmall!.copyWith(
                  fontWeight: FontWeight.w500,
                  color: isPresent ? Colors.white : Colors.black,
                ),
          ),
        );
      },
    );
  }
}
