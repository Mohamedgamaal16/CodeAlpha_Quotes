import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quotes/core/api/dio_consumer.dart';
import 'package:quotes/core/api/endpoint.dart';
import 'package:quotes/features/authors/data/repos/author_repo_impl.dart';
import 'package:quotes/features/authors/presentation/view/Author_view.dart';
import 'package:quotes/features/authors/presentation/view_model/cubit/authors_cubit.dart';
import 'package:quotes/features/home/data/repos/home_repo_impl.dart';
import 'package:quotes/features/home/peresetation/view_model/search_cubit/search_cubit.dart';
import 'package:quotes/features/home/peresetation/views/widgets/home_view_body.dart';
import 'package:quotes/features/profile/data/repos/profile_repo_impl.dart';
import 'package:quotes/features/profile/presentation/view_models/get_user_data_cubit/get_user_data_cubit.dart';
import 'package:quotes/features/profile/presentation/view_models/upload_pic/upload_pic_cubit.dart';
import 'package:quotes/features/profile/presentation/views/profile_view.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());
  int currentIndex = 0;
  final List<Widget> appPages = [
    BlocProvider(
      create: (context) => SearchCubit(HomeRepoImpl(
          api: DioConsumer(
              baseUrl: EndPoint.quotebaseUrl, quoteSever: true, dio: Dio()))),
      child: const HomeViewBody(),
    ),
    BlocProvider(
      create: (context) => AuthorsCubit(AuthorRpoImbl(
          api: DioConsumer(
              baseUrl: EndPoint.quotebaseUrl, quoteSever: true, dio: Dio())))
        ..fetchAuthors(),
      child: const AuthorView(),
    ),
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => UploadPicCubit(),
        ),
        BlocProvider(
          create: (context) => GetUserDataCubit(ProfileRepoImpl(
              api: DioConsumer(
                  dio: Dio(),
                  baseUrl: EndPoint.authbaseUrl,
                  quoteSever: false)))
            ..fetchUserData(),
        ),
      ],
      child: const ProfileView(),
    ),
  ];
  void changePages(int value) {
    currentIndex = value;
    emit(PageChanged());
  }
}
