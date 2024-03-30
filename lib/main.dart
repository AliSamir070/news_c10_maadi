import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:news_c10_maadi/shared/blov_observer.dart';
import 'package:news_c10_maadi/shared/theme.dart';
import 'package:news_c10_maadi/ui/home/home_screen.dart';

import 'di/di.dart';

void main() {
  Bloc.observer = MyBlocObserver();
  configureDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.LightTheme,
      initialRoute: HomeScreen.routename,
      debugShowCheckedModeBanner: false,
      routes: {
        HomeScreen.routename:(_)=>HomeScreen()
      },
    );
  }
}

