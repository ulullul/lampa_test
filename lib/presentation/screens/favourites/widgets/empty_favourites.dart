import 'package:flutter/material.dart';

class EmptyFavourites extends StatelessWidget {
  const EmptyFavourites({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.add_reaction_outlined,
            size: 100,
            color: Theme.of(context).colorScheme.secondary,
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            'Nothing. But you can add your favourite characters.',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                  fontSize: 16,
                ),
          ),
        ],
      ),
    );
  }
}
