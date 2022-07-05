import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rnm_t/presentation/blocs/character/character_bloc.dart';
import 'package:rnm_t/presentation/widgets/character_infinite_sliver_list.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Container(
              height: 40,
              margin: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5),
              ),
              child: Center(
                child: TextField(
                  controller: textController,
                  onChanged: (text) {
                    BlocProvider.of<CharacterBloc>(context).add(
                      SearchCharacter(text: text),
                    );
                  },
                  style: Theme.of(context).textTheme.bodySmall,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.search),
                    suffixIcon: IconButton(
                      icon: const Icon(Icons.clear),
                      onPressed: () {
                        BlocProvider.of<CharacterBloc>(context).add(
                          const ClearSearchCharacter(),
                        );
                        textController.clear();
                      },
                    ),
                    hintText: 'Search...',
                    // border: InputBorder.none,
                  ),
                ),
              ),
            ),
          ),
          const CharacterInfiniteSliverList(),
        ],
      ),
    );
  }
}
