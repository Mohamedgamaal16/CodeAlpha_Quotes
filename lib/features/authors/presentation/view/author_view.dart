import 'package:flutter/material.dart';
import 'package:quotes/core/utils/app_styles.dart';
import 'package:quotes/core/utils/constants.dart';
import 'package:quotes/core/utils/gradient_text.dart';
import 'package:quotes/features/authors/presentation/view/widgets/author_view_body.dart';

class AuthorView extends StatelessWidget {
  const AuthorView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(backgroundColor: AppColors.kPrimaryColor,
            title: GradientText(
              "Authors",
              style: AppStyles.poppinsStyleBold24(context),
              gradient: const LinearGradient(colors: AppColors.nameGradient),
            ),
          ),
          backgroundColor: AppColors.kPrimaryColor,
          body: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: AuthorViewBody(),
          )),
    );
  }
}
