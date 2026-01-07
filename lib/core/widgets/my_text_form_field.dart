import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../theme/fonts_style.dart';
import '../theme/my_colors.dart';

class MyTextFormField extends StatelessWidget {
  final bool? autofocus;
  final String hintText;
  final bool isObscure;
  final Widget? suffixIcon;
  final TextEditingController controller;
  final String? Function(String?)? val;
  const MyTextFormField({
    super.key,
    required this.val,
    required this.controller,
    required this.hintText,
    required this.isObscure,
    this.suffixIcon,
    this.autofocus,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: val,
      controller: controller,
      autofocus: autofocus ?? false,
      obscureText: isObscure,
      style: FontsStyle.font18GreyW300,
      decoration: InputDecoration(
        suffixIcon: suffixIcon,
        hintText: hintText,
        hintStyle: FontsStyle.font13GreyW300,
        filled: true,
        fillColor: MyColors.greyColor,
        border: OutlineInputBorder(
          gapPadding: 10,
          borderRadius: BorderRadius.circular(30.r),
        ),
      ),
    );
  }
}
