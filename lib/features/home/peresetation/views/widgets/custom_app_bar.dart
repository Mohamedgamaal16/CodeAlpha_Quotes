import 'package:flutter/material.dart';
import 'package:quotes/core/utils/app_styles.dart';
import 'package:quotes/core/utils/constants.dart';
import 'package:quotes/core/utils/gradient_text.dart';

class CustomAppBar extends StatelessWidget {
  final String title;

  const CustomAppBar({
    super.key,
    required this.title,
  });
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: true,
      floating: true,
      backgroundColor: AppColors.kPrimaryColor,
      title: GradientText(
        title,
        style: AppStyles.poppinsStyleBold24(context),
        gradient: const LinearGradient(colors: AppColors.nameGradient),
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.search),
          color: Colors.white,
          onPressed: () {},
        ),
      ],
      bottom: TabBar(
        isScrollable: true,
        tabAlignment: TabAlignment.start,
        indicatorColor: const Color(0xff68738D),
        indicatorWeight: 0.0001,
        unselectedLabelColor: const Color(0xff68738D),
        labelColor: Colors.white,
        labelStyle: AppStyles.poppinsStyleSemiBold14(context),
        tabs: const [
          Tab(text: 'Today Quotes'),
          Tab(text: 'Popular Quotes'),
          Tab(text: 'Happy Quotes'),
          Tab(text: 'Sad Quotes'),
        ],
      ),
    );
  }
}
