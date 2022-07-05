import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:rnm_t/injector.dart';

import 'presentation/screens/app/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: '.env');
  await initializeDependencies();
  await injector.allReady();
  runApp(MyApp());
}
