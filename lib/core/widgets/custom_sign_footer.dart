import 'package:flutter/material.dart';
import 'package:quotes/core/utils/app_styles.dart';

class CustomSignFooter extends StatelessWidget {
  const CustomSignFooter({
    super.key,
     required this.pageName, required this.onTap, required this.sentence,
  });
final String pageName,sentence;
final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          sentence,
          style: AppStyles.poppinsStyleRegular14(context),
        ),
        GestureDetector(
          onTap: onTap,
          child: Text(
            pageName,
            style: AppStyles.poppinsStyleBold14(context),
          ),
        )
      ],
    );
  }
}
