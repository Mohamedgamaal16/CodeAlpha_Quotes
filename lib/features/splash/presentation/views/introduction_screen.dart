import 'package:flutter/material.dart';

import 'package:quotes/features/splash/presentation/views/widgets/on_boarding_view_body.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(body: OnBoardingScreenBody()),
    );
  }
}
