part of 'home_tabs_cubit.dart';

enum MainTab { home, search, favourites }

class MainTabsState {
  final MainTab tab;
  const MainTabsState({
    this.tab = MainTab.home,
  });
}

class MainTabsInitial extends MainTabsState {}
