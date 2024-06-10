
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:quotes/core/utils/app_styles.dart';
import 'package:quotes/core/widgets/custom_button.dart';
import 'package:quotes/core/widgets/custom_input_field.dart';
import 'package:quotes/features/profile/presentation/view_models/change_password_cubit/change_password_cubit.dart';

class ChangePasswordViewBody extends StatelessWidget {
  const ChangePasswordViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ChangePasswordCubit, ChangePasswordState>(
      listener: (context, state) {
        if (state is ChangePasswordSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.message),
            ),
          );
        } else if (state is ChangePasswordFaliure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.errMsg),
            ),
          );
        }
      },
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Change password',
                style: AppStyles.poppinsStyleBold24(context),
              ),
              const SizedBox(height: 50),
              CustomInputField(
                suffixIcon: true,
                obscureText: true,
                labelText: 'Current Password',
                hintText: 'Enter your current password',
                controller: context.read<ChangePasswordCubit>().oldPassword,
              ),
              const SizedBox(height: 16),
              CustomInputField(
                obscureText: true,
                suffixIcon: true,
                labelText: 'New Password',
                hintText: 'Enter a new password',
                controller: context.read<ChangePasswordCubit>().newPassword,
              ),
              const SizedBox(height: 16),
              CustomInputField(
                obscureText: true,
                suffixIcon: true,
                labelText: 'Confirm Password',
                hintText: 'Confirm your new password',
                controller: context.read<ChangePasswordCubit>().confirmPassword,
              ),
              const SizedBox(height: 16),
              state is ChangePasswordLoading
                  ? const CircularProgressIndicator()
                  : CustomButton(
                      labelName: 'Change Password',
                      onPressed: () {
                        context.read<ChangePasswordCubit>().changePassword();
                      },
                    ),
            ],
          ),
        );
      },
    );
  }
}
