import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rnm_t/domain/entities/character/character.dart';
import 'package:rnm_t/presentation/blocs/favourites/favourites_bloc.dart';
import 'package:rnm_t/presentation/widgets/favourite_button.dart';

class CharacterCard extends StatefulWidget {
  final Character character;
  const CharacterCard({
    Key? key,
    required this.character,
  }) : super(key: key);

  @override
  State<CharacterCard> createState() => _CharacterState();
}

class _CharacterState extends State<CharacterCard> {
  @override
  Widget build(BuildContext context) {
    final char = widget.character;

    return Card(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      margin: const EdgeInsets.symmetric(vertical: 22, horizontal: 20),
      elevation: 3,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              char.name,
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              '${char.species} - ${char.status}',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: Center(
                child: Image.network(
                  char.image,
                  height: 175,
                ),
              ),
            ),
            _buildText('Type', char.type),
            _buildText('Gender', char.gender),
            _buildText('Location', char.location.name),
            _buildText('Created', char.created.toString()),
            const SizedBox(
              height: 20,
            ),
            FavouriteButton(
                characterId: char.id,
                onTap: () {
                  BlocProvider.of<FavouritesBloc>(context).add(
                    AddFavourite(character: char),
                  );
                }),
          ],
        ),
      ),
    );
  }

  Widget _buildText(String title, String? text) {
    String? finalText = text;
    if (finalText == null || finalText.isEmpty) finalText = 'Unknown';
    return Text(
      '$title: $finalText',
      style: Theme.of(context).textTheme.bodySmall,
    );
  }
}
