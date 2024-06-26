
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:quotes/features/auth/presention/views/sign_in_view.dart';
import 'package:quotes/features/auth/presention/views/sign_up_view.dart';
import 'package:quotes/features/authors/presentation/view/single_author_view.dart';
import 'package:quotes/features/home/peresetation/view_model/home_cubit/home_cubit.dart';
import 'package:quotes/features/home/peresetation/views/home_view.dart';
import 'package:quotes/features/profile/presentation/views/about_page.dart';
import 'package:quotes/features/profile/presentation/views/change_passwod.dart';
import 'package:quotes/features/splash/presentation/views/introduction_screen.dart';
import 'package:quotes/features/splash/presentation/views/splash_view.dart';

abstract class AppRouter {
  static const kSplashView = '/';
static const kHomeView = '/home';
static const kSignUp = '/signup';
static const  kIntroductionScreen="/IntroductionScreen";
static const kLogInView = '/signin';
 static const kChangePassword = '/changePassword';
  static const kAboutPage = '/AboutPage';
  static final GoRouter router = GoRouter(routes: [
    GoRoute(
      path: kSplashView,
      builder: (context, state) => const SplashView(),
    ), 
    
      
    GoRoute(
      path: kAboutPage,
      builder: (context, state) => const AboutPage(),
    ),GoRoute(
      path: kChangePassword,
      builder: (context, state) => const ChangePasswordView(),
    ),
    GoRoute(
      path: kSignUp,
      builder: (context, state) => const SignUpView(),
    ),GoRoute(
      path: kLogInView,
      builder: (context, state) => const SignInView(),
    ),GoRoute(
      path: kIntroductionScreen,
      builder: (context, state) => const OnBoardingScreen(),
    ),
     GoRoute(
      path: kHomeView,
      builder: (context, state) => BlocProvider(
        create: (context) => HomeCubit(),
        child: const HomeView(),
      ),
    ),
  ]);
}
