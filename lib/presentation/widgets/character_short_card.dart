import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rnm_t/domain/entities/character/character.dart';
import 'package:rnm_t/internal/router/app_routes.dart';
import 'package:rnm_t/presentation/blocs/favourites/favourites_bloc.dart';
import 'package:rnm_t/presentation/widgets/favourite_button.dart';
import 'package:rnm_t/presentation/widgets/splash_effect.dart';

class CharacterShortCard extends StatelessWidget {
  final Character item;
  const CharacterShortCard({
    Key? key,
    required this.item,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 9, horizontal: 18),
      child: SplashEffect.all(
        10,
        color: Colors.white,
        highlightColor: Colors.transparent,
        elevation: 3,
        onTap: () => Navigator.pushNamed(
          context,
          AppRoutes.DETAILS,
          arguments: item,
        ),
        child: Card(
          color: Colors.transparent,
          elevation: 0,
          shadowColor: Colors.transparent,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 16.0),
                      child: CircleAvatar(
                        radius: 24,
                        backgroundImage: NetworkImage(item.image),
                      ),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            item.name,
                            style: Theme.of(context).textTheme.headlineLarge,
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Text(
                            '${item.species} - ${item.status}',
                            style: Theme.of(context).textTheme.headlineMedium,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 30.0),
                  child: Text(
                    'Last known location: \n${item.location.name}',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ),
                FavouriteButton(
                  characterId: item.id,
                  onTap: () {
                    BlocProvider.of<FavouritesBloc>(context).add(
                      AddFavourite(character: item),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
