import 'package:firebase_example/locator.dart';
import 'package:flutter/material.dart';

import 'screens/home.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Register all the models and services before the app starts
  await setupLocator();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Firebase Example',
      home: HomeScreen(),
    );
  }
}
