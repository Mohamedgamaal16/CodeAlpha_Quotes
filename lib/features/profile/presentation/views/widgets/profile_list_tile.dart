
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:quotes/core/utils/app_styles.dart';

class ProfileListTile extends StatelessWidget {
  const ProfileListTile({
    super.key,
    required this.icon,
    required this.title,
    required this.subTitle,
    this.onTap,
    this.color = Colors.white,
  });
  final IconData icon;
  final String title;
  final String subTitle;
  final void Function()? onTap;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 32),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          color: Colors.transparent,
          child: Row(children: [
            Icon(
              icon,
              color: color,
              size: 24,
            ),
            const SizedBox(
              width: 8,
            ),
            Text(
              title,
              style: AppStyles.interStyleBold12(context).copyWith(color: Colors.white),
            ),
            const Spacer(),
            Text(
              subTitle,
              style: AppStyles.interStyleRegular12(context).copyWith(color: Colors.white),
            ),
            const SizedBox(
              width: 8,
            ),
            const Icon(
              FontAwesomeIcons.chevronRight,
              size: 12,
              color:  Colors.white,
            ),
          ]),
        ),
      ),
    );
  }
}
