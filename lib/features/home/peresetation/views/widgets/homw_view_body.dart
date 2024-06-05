import 'package:flutter/material.dart';
import 'package:quotes/core/utils/constants.dart';
import 'package:quotes/features/home/peresetation/views/widgets/custom_app_bar.dart';
import 'package:quotes/features/home/peresetation/views/widgets/today_view.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(backgroundColor: AppColors.kPrimaryColor,
        body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return [
              const CustomAppBar(title: "Quotes"),
            ];
          },
          body: const TabBarView(
            children: [
                TodayView()

              ,
              TodayView(),
              TodayView(),
              TodayView(),
            ],
          ),
        ),
      ),
    );
  }
}
