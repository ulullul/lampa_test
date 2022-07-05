import 'package:flutter/material.dart';
import 'package:rnm_t/internal/router/app_screens.dart';
import 'package:rnm_t/resouces/images/app_images.dart';

class LaunchScreen extends StatefulWidget {
  const LaunchScreen({Key? key}) : super(key: key);

  @override
  State<LaunchScreen> createState() => _LaunchScreenState();
}

class _LaunchScreenState extends State<LaunchScreen> {
  final _screens = AppScreens();
  @override
  void initState() {
    super.initState();
    _init();
  }

  void _init() async {
    // long init operations
    await Future.delayed(const Duration(seconds: 1));
    _redirectToNextRoute();
  }

  void _redirectToNextRoute() {
    Navigator.of(context).pushReplacementNamed(
      _screens.kInitialRoute,
    );
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      AppImages.launch,
      fit: BoxFit.cover,
    );
  }
}
