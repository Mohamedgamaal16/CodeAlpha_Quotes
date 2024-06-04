
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:quotes/features/home/peresetation/view_model/home_cubit/home_cubit.dart';
import 'package:quotes/features/home/peresetation/views/home_view.dart';
import 'package:quotes/features/splash/presentation/views/splash_view.dart';

abstract class AppRouter {
  static const kSplashView = '/';
static const kHomeView = '/home';

  static final GoRouter router = GoRouter(routes: [
    GoRoute(
      path: kSplashView,
      builder: (context, state) => const SplashView(),
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
