import 'package:dictionary/logic/business_logic.dart';
import 'package:dictionary/presentation/screens/search_screen.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SplashScreenLottie extends StatefulWidget {
  const SplashScreenLottie({super.key});
  static const routeName = '/splash-screen-lottie';

  @override
  State<SplashScreenLottie> createState() => _SplashScreenLottieState();
}

class _SplashScreenLottieState extends State<SplashScreenLottie>
    with TickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Lottie.asset(
          'assets/animations/dictionary_lottie.json',
          controller: _animationController,
          animate: true,
          onLoaded: (p0) {
            _animationController.forward().whenComplete(
                  () => BusinessLogic().splashScreenLoaded(context),
                );
          },
        ),
      ),
    );
  }
}
