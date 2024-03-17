import 'package:flutter/material.dart';
import 'package:news_c10_maadi/shared/theme.dart';
import 'package:news_c10_maadi/ui/home/home_screen.dart';

void main() {
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

