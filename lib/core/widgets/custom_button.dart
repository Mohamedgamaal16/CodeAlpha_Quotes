
import 'package:flutter/material.dart';
import 'package:quotes/core/utils/app_styles.dart';
import 'package:quotes/core/utils/constants.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    Key? key,
    this.color = AppColors.kPrimaryColor,
    required this.labelName,
    this.textColor = Colors.white,
    this.onPressed,
    this.haveBorder = false,
    this.borderRadius = 15,
  }) : super(key: key);

  final Color color, textColor;
  final String labelName;
  final void Function()? onPressed;
  final bool haveBorder;
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 65,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
            side: haveBorder
                ? const BorderSide(
                    color: Colors.white) // Set border color to white
                : BorderSide.none, // No border
          ),
          elevation: 0,
          backgroundColor: color,
        ),
        onPressed: onPressed,
        child: Text(
          labelName,
          style: AppStyles.poppinsStyleSemiBold16(context).copyWith(
            color: textColor,
          ),
        ),
      ),
    );
  }
}
