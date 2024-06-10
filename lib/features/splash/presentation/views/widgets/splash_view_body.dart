import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:quotes/core/utils/app_router.dart';
import 'package:quotes/core/utils/app_styles.dart';
import 'package:quotes/core/utils/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 2000), () {
      navigateToNextPage(context);
    });
  }

  void navigateToNextPage(BuildContext context) async {
    final prefs = await SharedPreferences.getInstance();

    final hasToken = prefs.getBool("isLogin") ?? false; // Set default to false

    if (hasToken) {
      GoRouter.of(context).pushReplacement(AppRouter.kHomeView);
    } else {
      GoRouter.of(context).pushReplacement(AppRouter.kLogInView);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 1,
      width: MediaQuery.of(context).size.width * 1,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AnimatedTextKit(
            animatedTexts: [
              ColorizeAnimatedText(
                'QUOTES',
                textStyle: AppStyles.poppinsStyleBold60(context),
                colors: AppColors.nameGradient,
                speed: const Duration(milliseconds: 1000),
              )
            ],
          ),
          const SizedBox(height: 12.0),
          AnimatedTextKit(
            animatedTexts: [
              TypewriterAnimatedText(
                'Explore a world of quotes',
                textStyle: AppStyles.poppinsStyleMedium16(context)
                    .copyWith(color: Colors.white),
              )
            ],
          ),
        ],
      ),
    );
  }
}
