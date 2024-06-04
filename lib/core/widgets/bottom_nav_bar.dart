import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:quotes/core/utils/app_styles.dart';
import 'package:quotes/core/utils/constants.dart';

class CustomBottomNavBar extends StatelessWidget {
  const CustomBottomNavBar({
    super.key,
    required this.changePages,
    required this.cureentIndex,
  });
  final int cureentIndex;
  final Function(int) changePages;
  @override
  Widget build(BuildContext context) {
    //
    return Padding(
      padding: const EdgeInsets.only(top: 10, bottom: 17, left: 16, right: 16),
      child: GNav(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        activeColor: Colors.white,
        textStyle: AppStyles.poppinsStyleMedium12(context),
        gap: 6,
        tabBackgroundColor: AppColors.kPrimaryColor,
        onTabChange: changePages,
        tabs: const [
          GButton(
            icon: FontAwesomeIcons.house,
            text: 'Home',
            iconColor: Colors.black,
          ),
          GButton(
            icon: FontAwesomeIcons.user,
            text: 'Authors',
            iconColor: Colors.black,
          ),
        ],
        selectedIndex: cureentIndex,
      ),
    );
  }
}
