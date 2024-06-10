import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:quotes/core/utils/app_router.dart';
import 'package:quotes/core/utils/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnBoardingScreenBody extends StatelessWidget {
  const OnBoardingScreenBody({super.key});
  static final List<PageViewModel> pages = [
    PageViewModel(
      decoration: const PageDecoration(
        titleTextStyle: TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.w600,
          fontFamily: 'Poppins',
        ),
        bodyTextStyle: TextStyle(
          fontSize: 18,
          fontFamily: 'Poppins',
        ),
      ),
      image: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Image.asset("assets/images/first.png",
              width: 700, height: 700, fit: BoxFit.fill),
        ),
      ),
      title: "Find Inspiration Every Day with QUOTES",
      body:
          "Discover a world of wisdom and motivation from the greatest minds.",
    ),
    PageViewModel(
      decoration: const PageDecoration(
        titleTextStyle: TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.w600,
          fontFamily: 'Poppins',
        ),
        bodyTextStyle: TextStyle(
          fontSize: 18,
          fontFamily: 'Poppins',
        ),
      ),
      image: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Image.asset("assets/images/sec.png",
              width: 700, height: 700, fit: BoxFit.fill),
        ),
      ),
      title: "Meet the Minds Behind the Words",
      body:
          "Uncover the stories and wisdom of legendary and up-and-coming authors.",
    ),
    PageViewModel(
      decoration: const PageDecoration(
        titleTextStyle: TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.w600,
          fontFamily: 'Poppins',
        ),
        bodyTextStyle: TextStyle(
          fontSize: 18,
          fontFamily: 'Poppins',
        ),
      ),
      image: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Image.asset("assets/images/third.png",
              width: 700, height: 700, fit: BoxFit.fill),
        ),
      ),
      title: "Make Your Voice Heard on QUOTES",
      body: "Join our vibrant community and own words of inspiration.",
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
      onDone: () => onDone(context),
      showDoneButton: true,
      showSkipButton: true,
      next: const Icon(
        FontAwesomeIcons.arrowRight,
        color: AppColors.kPrimaryColor,
      ),
      done: const Text(
        "Done",
        style: TextStyle(color: AppColors.kPrimaryColor),
      ),
      skip: const Text(
        "Skip",
        style: TextStyle(color: AppColors.kPrimaryColor),
      ),
      pages: pages,
      curve: Curves.bounceOut,
      dotsDecorator: DotsDecorator(
        activeColors: AppColors.buttonGradient,
        color: AppColors.kPrimaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(2.0),
        ),
        size: const Size(10.0, 8.0),
        activeSize: const Size(25.0, 8.0),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(2.0),
        ),
      ),
    );
  }

  void onDone(context) async {
    final prefs = await SharedPreferences.getInstance();

    prefs.setBool("onBoardingDone", true);

    GoRouter.of(context).pushReplacement(AppRouter.kHomeView);
  }
}
