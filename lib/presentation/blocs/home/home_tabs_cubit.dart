import 'package:bloc/bloc.dart';

part 'home_tabs_state.dart';

class MainTabsCubit extends Cubit<MainTabsState> {
  MainTabsCubit() : super(MainTabsInitial());

  void setTab(MainTab tab) => emit(MainTabsState(tab: tab));
}
