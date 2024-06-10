
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quotes/core/api/dio_consumer.dart';
import 'package:quotes/core/api/endpoint.dart';
import 'package:quotes/core/utils/constants.dart';
import 'package:quotes/features/profile/data/repos/profile_repo_impl.dart';
import 'package:quotes/features/profile/presentation/view_models/change_password_cubit/change_password_cubit.dart';
import 'package:quotes/features/profile/presentation/views/widgets/change_password_view_body.dart';

class ChangePasswordView extends StatelessWidget {
  const ChangePasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: AppColors.kPrimaryColor,
        title: const Text('Back'),
      ),
      body:  SafeArea(
        child: BlocProvider(
          create: (context) => ChangePasswordCubit(ProfileRepoImpl(api: DioConsumer(dio: Dio(), baseUrl: EndPoint.authbaseUrl, quoteSever: false))),
          child: const ChangePasswordViewBody(),
        ),
      ),
    );
  }
}
