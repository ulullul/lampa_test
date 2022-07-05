import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rnm_t/internal/router/app_routes.dart';
import 'package:rnm_t/internal/router/app_screens.dart';
import 'package:rnm_t/presentation/blocs/home/home_tabs_cubit.dart';
import 'package:rnm_t/resouces/theme/custom_theme.dart';

class MyApp extends StatelessWidget {
  final _appScreens = AppScreens();

  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<MainTabsCubit>(create: (_) => MainTabsCubit()),
      ],
      child: MaterialApp(
        title: 'Rick and Morty test',
        theme: CustomTheme.lightTheme,
        onGenerateRoute: _appScreens.onGenerateRoute,
        initialRoute: AppRoutes.LAUNCH,
      ),
    );
  }
}
