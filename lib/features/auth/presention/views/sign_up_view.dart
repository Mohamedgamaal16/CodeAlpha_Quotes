
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:quotes/core/api/dio_consumer.dart';
import 'package:quotes/core/api/endpoint.dart';
import 'package:quotes/core/utils/app_styles.dart';
import 'package:quotes/core/utils/constants.dart';
import 'package:quotes/features/auth/data/repos/auth_repo_imp.dart';
import 'package:quotes/features/auth/presention/viewmodel/cubit/auth_cubit.dart';
import 'package:quotes/features/auth/presention/views/widgets/sign_up_view_body.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'back',
          style: AppStyles.poppinsStyleMedium16(context),
        ),
        leading: IconButton(
            onPressed: () {
              GoRouter.of(context).pop();
            },
            icon: const Icon(
              Icons.arrow_back,
              color: AppColors.kPrimaryColor,
            )),
      ),
      body:  SafeArea(
          child: SingleChildScrollView(
              child: BlocProvider(
        create: (context) => AuthCubit(AuthRepoImp(api: DioConsumer(dio: Dio(), baseUrl: EndPoint.authbaseUrl,quoteSever: false ))),
        child: const SignUpViewBody(),
      ))),
    );
  }
}
