import 'package:dictionary/presentation/animations/splash_screen_lottie.dart';
import 'package:dictionary/presentation/screens/failure_screen.dart';
import 'package:dictionary/presentation/screens/loading_screen.dart';
import 'package:dictionary/presentation/screens/search_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const SplashScreenLottie(),
      routes: {
        SearchScreen.routeName: (context) => const SearchScreen(),
        LoadingScreen.routeName: (context) => const LoadingScreen(),
        SplashScreenLottie.routeName: (context) => const SplashScreenLottie(),
      },
    );
  }
}
