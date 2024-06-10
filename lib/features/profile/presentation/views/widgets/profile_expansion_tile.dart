
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:quotes/core/utils/app_styles.dart';
import 'package:quotes/core/utils/constants.dart';

class ProfileExpansionTile extends StatefulWidget {
  const ProfileExpansionTile({
    super.key,
    required this.icon,
    required this.title,
    required this.subTitle,
    required this.expandedWidget,
  });
  final IconData icon;
  final String title;
  final String subTitle;
  final Widget expandedWidget;

  @override
  State<ProfileExpansionTile> createState() => _ProfileExpansionTile();
}

class _ProfileExpansionTile extends State<ProfileExpansionTile> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 32),
      child: Column(
        children: [
          GestureDetector(
            onTap: () {
              setState(() {
                isExpanded = !isExpanded;
              });
            },
            child: Container(
              color: Colors.transparent,
              child: Row(children: [
                Icon(
                  widget.icon,
                  color: AppColors.kPrimaryColor,
                  size: 24,
                ),
                const SizedBox(
                  width: 8,
                ),
                Text(
                  widget.title,
                  style: AppStyles.interStyleBold12(context),
                ),
                const Spacer(),
                Text(
                  widget.subTitle,
                  style: AppStyles.interStyleRegular12(context),
                ),
                const SizedBox(
                  width: 8,
                ),
                Icon(
                  isExpanded
                      ? FontAwesomeIcons.chevronDown
                      : FontAwesomeIcons.chevronRight,
                  size: 12,
                  color: AppColors.kPrimaryColor,
                ),
              ]),
            ),
          ),
          isExpanded ? widget.expandedWidget : const SizedBox(),
        ],
      ),
    );
  }
}
