
import 'package:flutter/material.dart';
import 'package:quotes/core/utils/app_styles.dart';
import 'package:quotes/core/utils/constants.dart';
import 'package:quotes/core/utils/gradient_text.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title; // Add a parameter for the title

  const CustomAppBar({
    super.key,
    required this.title,
  });

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight); 

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.kPrimaryColor,
      title: GradientText(
        title,
        style: AppStyles.poppinsStyleBold18(context),
        gradient: const LinearGradient(colors: AppColors.nameGradient),
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.search),
          color: Colors.white,
          onPressed: () {
            // Handle search functionality
          },
        ),
      ],
    );
  }
}
