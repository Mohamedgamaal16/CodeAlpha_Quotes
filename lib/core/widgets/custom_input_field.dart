
import 'package:flutter/material.dart';
import 'package:quotes/core/utils/app_styles.dart';
import 'package:quotes/core/utils/constants.dart';

class CustomInputField extends StatefulWidget {
  const CustomInputField({
    super.key,
    required this.labelText,
    required this.hintText,
    this.suffixIcon = false,
    this.isDense,
    this.obscureText = false,
    this.controller,  this.minLines=1,  this.maxLines=1, 
  });

  final String labelText, hintText;
  final bool suffixIcon, obscureText;
  final bool? isDense;
  final TextEditingController? controller;
final int minLines,maxLines;
  @override
  State<CustomInputField> createState() => _CustomInputFieldState();
}

class _CustomInputFieldState extends State<CustomInputField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: ShapeDecoration(
          shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      )),
      child: TextFormField(
        minLines: widget.minLines ,
        maxLines:widget.maxLines ,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        validator: (textValue) {
          if (textValue == null || textValue.isEmpty) {
            return 'is required';
          } else {
            return null;
          }
        },
        obscureText: (widget.obscureText && _obscureText),
        decoration: InputDecoration(
            border: outline(),
            enabledBorder: outline(),
            focusedBorder: outline(),
            disabledBorder: outline(),
            fillColor: const Color(0xFFF9FCFE),
            filled: true,
            isDense: (widget.isDense != null) ? widget.isDense : false,
            suffixIcon: widget.suffixIcon
                ? IconButton(
                    icon: Icon(
                      _obscureText
                          ? Icons.remove_red_eye
                          : Icons.visibility_off_outlined,
                      color: Colors.black54,
                    ),
                    onPressed: () {
                      setState(() {
                        _obscureText = !_obscureText;
                      });
                    },
                  )
                : null,
            suffixIconConstraints: (widget.isDense != null)
                ? const BoxConstraints(maxHeight: 33)
                : null,
            hintText: widget.hintText,
            label: Text(
              widget.labelText,
              style: AppStyles.poppinsStyleRegular12(context),
            ),
            hintStyle: AppStyles.poppinsStyleRegular14(context)),
        controller: widget.controller,
      ),
    );
  }

  OutlineInputBorder outline() {
    return OutlineInputBorder(
        borderSide: const BorderSide(color: AppColors.kPrimaryColor),
        borderRadius: BorderRadius.circular(12));
  }

  UnderlineInputBorder removeBorder() {
    return const UnderlineInputBorder(
        borderSide: BorderSide(style: BorderStyle.solid));
  }
}
