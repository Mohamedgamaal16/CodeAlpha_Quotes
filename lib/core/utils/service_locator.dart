
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:quotes/core/api/dio_consumer.dart';
import 'package:shared_preferences/shared_preferences.dart';

final getIt = GetIt.instance;

Future registerInstances() async {
  getIt.registerSingletonAsync<SharedPreferences>(
    () => SharedPreferences.getInstance(),
  );
 

  // getIt.registerSingleton(CartRepoImp(api: getIt.get<DioConsumer>()));
  // getIt.registerSingleton(SplashRepoImpl());
  // getIt.registerSingleton(HomeRepoImpl(api: DioConsumer(dio: Dio())));
  // getIt.registerSingleton(ProfileRepoImpl(api: DioConsumer(dio: Dio())));
}
  // static final prefs = getIt.getAsync<SharedPreferences>();
  // static final splashRepoImpl = getIt.get<SplashRepoImpl>();
  // static final homeRepoImpl = getIt.get<HomeRepoImpl>();
  // static final profileRepoImpl = getIt.get<ProfileRepoImpl>();
