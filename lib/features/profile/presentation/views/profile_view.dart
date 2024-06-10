
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quotes/core/utils/constants.dart';
import 'package:quotes/features/profile/presentation/view_models/get_user_data_cubit/get_user_data_cubit.dart';
import 'package:quotes/features/profile/presentation/views/widgets/profile_view_body.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kPrimaryColor,
      body: SafeArea(
        child: BlocBuilder<GetUserDataCubit, GetUserDataState>(
          builder: (context, state) {
            if (state is GetUserDataLoading) {
              return const Center(
                child: CircularProgressIndicator(
                  color: AppColors.kPrimaryColor,
                ),
              );
            } else {
              return const SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  child: ProfileViewBody(),
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
