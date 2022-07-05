import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rnm_t/presentation/blocs/favourites/favourites_bloc.dart';
import 'package:rnm_t/presentation/screens/favourites/widgets/empty_favourites.dart';
import 'package:rnm_t/presentation/widgets/character_short_card.dart';

class FavouritesScreen extends StatefulWidget {
  const FavouritesScreen({Key? key}) : super(key: key);

  @override
  State<FavouritesScreen> createState() => _FavouritesScreenState();
}

class _FavouritesScreenState extends State<FavouritesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<FavouritesBloc, FavouritesState>(
        builder: (context, state) {
          if (state.favourites == null || state.favourites!.isEmpty) {
            return const Center(
              child: EmptyFavourites(),
            );
          }
          return ListView.builder(
            itemBuilder: (_, index) {
              return CharacterShortCard(item: state.favourites![index]);
            },
            itemCount: state.favourites!.length,
          );
        },
      ),
    );
  }
}
