// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ignore: must_be_immutable
class MyButtonGradient extends StatelessWidget {
  final double width;
  final double height;
  final String text;
  final TextStyle? textstyle;
  final List<Color> colors;
  void Function()? function;
  MyButtonGradient({
    Key? key,
    required this.width,
    required this.height,
    required this.text,
    required this.textstyle,
    required this.colors,
    this.function,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: width.w,
      height: height.h,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          stops: [0.0, 1.0],
          colors: colors,
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
        borderRadius: BorderRadius.circular(30.r),
      ),
      child: GestureDetector(
        onTap: function,
        child: Text(text, style: textstyle),
      ),
    );
  }
}
