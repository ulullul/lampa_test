import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rnm_t/injector.dart';
import 'package:rnm_t/presentation/blocs/favourites/favourites_bloc.dart';
import 'package:rnm_t/presentation/screens/details/details_screen.dart';
import 'package:rnm_t/presentation/screens/launch_screen/launch_screen.dart';
import 'package:rnm_t/presentation/screens/main/main_screen.dart';

import 'app_routes.dart';

class AppScreens {
  final FavouritesBloc _favouritesBloc = injector()
    ..add(const GetAllFavourites());
  final kInitialRoute = AppRoutes.MAIN;

  Route? onGenerateRoute(RouteSettings setting) {
    switch (setting.name) {
      case AppRoutes.MAIN:
        return MaterialPageRoute(
          builder: (BuildContext context) => BlocProvider.value(
            value: _favouritesBloc,
            child: const MainScreen(),
          ),
          settings: setting,
        );
      case AppRoutes.DETAILS:
        return MaterialPageRoute(
          builder: (BuildContext context) => BlocProvider.value(
            value: _favouritesBloc,
            child: const DetailsScreen(),
          ),
          settings: setting,
        );
      case AppRoutes.LAUNCH:
        return MaterialPageRoute(
          builder: (BuildContext context) => const LaunchScreen(),
        );
      default:
        return null;
    }
  }
}
