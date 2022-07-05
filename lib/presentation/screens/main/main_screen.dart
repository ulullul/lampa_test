import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rnm_t/injector.dart';
import 'package:rnm_t/presentation/blocs/character/character_bloc.dart';
import 'package:rnm_t/presentation/blocs/home/home_tabs_cubit.dart';

import '../favourites/favourites_screen.dart';
import '../home/home_screen.dart';
import '../search/search_screen.dart';
import 'widgets/main_tab_button.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final selectedTab =
        context.select((MainTabsCubit cubit) => cubit.state.tab);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Rick and Morty'),
      ),
      bottomNavigationBar: BottomAppBar(
        elevation: 10,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            MainTabButton(
              groupValue: selectedTab,
              value: MainTab.home,
              icon: Icons.home,
              text: 'Home',
            ),
            MainTabButton(
              groupValue: selectedTab,
              value: MainTab.search,
              icon: Icons.search,
              text: 'Search',
            ),
            MainTabButton(
              groupValue: selectedTab,
              value: MainTab.favourites,
              icon: Icons.favorite,
              text: 'Favourites',
            ),
          ],
        ),
      ),
      body: IndexedStack(
        index: selectedTab.index,
        children: [
          BlocProvider<CharacterBloc>(
            create: (_) => injector.get<CharacterBloc>(),
            child: const HomeScreen(),
          ),
          BlocProvider<CharacterBloc>(
            create: (_) => injector.get<CharacterBloc>(),
            child: const SearchScreen(),
          ),
          const FavouritesScreen(),
        ],
      ),
    );
  }
}
