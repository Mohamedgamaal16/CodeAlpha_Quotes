import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:quotes/core/utils/app_router.dart';
import 'package:quotes/core/utils/app_styles.dart';
import 'package:quotes/core/utils/constants.dart';
import 'package:quotes/core/widgets/custom_button.dart';
import 'package:quotes/core/widgets/custom_input_field.dart';
import 'package:quotes/core/widgets/custom_sign_footer.dart';
import 'package:quotes/core/widgets/loading_indicator.dart';
import 'package:quotes/features/auth/presention/viewmodel/cubit/auth_cubit.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:awesome_dialog/awesome_dialog.dart';

class SignInViewBody extends StatelessWidget {
  const SignInViewBody({super.key});

  get getIt => null;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) async {
        if (state is AuthSuccessful) {
          final  prefs = await SharedPreferences.getInstance();

       final onBoardingDone = prefs.getBool("onBoardingDone")?? false ; // Set default to false

  if (onBoardingDone) {
    GoRouter.of(context).pushReplacement(AppRouter.kHomeView);
  } else {
    GoRouter.of(context).pushReplacement(AppRouter.kIntroductionScreen);
  }
        } else if (state is AuthFaliure) {
         
          AwesomeDialog(
            context: context,
            animType: AnimType.scale,
            dialogType: DialogType.error,
            body: Center(
              child: Padding(
                padding: const EdgeInsets.all(16.0), 
                child: Text(
                  state.errMessage,
                  style: AppStyles.poppinsStyleRegular14(context),
                ),
              ),
            ),
            btnCancelOnPress: () {},
          ).show();
        }
      },
      builder: (context, state) {
        return SizedBox(
          width: MediaQuery.of(context).size.width * 1,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 35,
                ),
                Text(
                  'Welcome Back!',
                  style: AppStyles.poppinsStyleBold24(context),
                ),
                const SizedBox(
                  height: 100,
                ),
                CustomInputField(
                  labelText: 'Email Address',
                  hintText: 'Enter your email',
                  controller: context.read<AuthCubit>().signInEmail,
                ),
                const SizedBox(
                  height: 16,
                ),
                CustomInputField(
                  labelText: 'Password',
                  hintText: "Enter your password",
                  obscureText: true,
                  suffixIcon: true,
                  controller: context.read<AuthCubit>().signInPassword,
                ),
                const SizedBox(
                  height: 11,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 1,
                  child: Text(
                    'Forgot password?',
                    style: AppStyles.poppinsStyleBold14(context),
                    textAlign: TextAlign.end,
                  ),
                ),
                const SizedBox(
                  height: 27,
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    state is AuthLoading
                        ? const CustomLoadingIndicator()
                        : Expanded(
                            child: CustomButton(
                              color: AppColors.kPrimaryColor,
                              labelName: 'login',
                              textColor: Colors.white,
                              onPressed: () {
                                context.read<AuthCubit>().login();
                              },
                            ),
                          ),
                  ],
                ),
                const SizedBox(
                  height: 32,
                ),
                CustomSignFooter(
                  pageName: 'Sign Up',
                  onTap: () {
                    GoRouter.of(context).push(AppRouter.kSignUp);
                  },
                  sentence: "Don't have an account?",
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
