import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/theme/fonts_style.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class PercentsWidget extends StatelessWidget {
  const PercentsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        CircularPercentIndicator(
          arcType: ArcType.FULL,
          arcBackgroundColor: Colors.transparent,
          radius: 50.0.r,
          lineWidth: 12.0.w,
          percent: 1.0,
          center: Text("100%", style: FontsStyle.font18BoldWhite),
          footer: Text("Bills", style: FontsStyle.font18BoldWhite),
          progressColor: Colors.green,
        ),
        CircularPercentIndicator(
          progressColor: Colors.yellow,
          arcType: ArcType.FULL,
          arcBackgroundColor: Colors.transparent,
          radius: 50.0.r,
          lineWidth: 12.0.w,
          percent: 0.25,
          center: Text("25%", style: FontsStyle.font18BoldWhite),
          footer: Text("Internet", style: FontsStyle.font18BoldWhite),
        ),
        CircularPercentIndicator(
          arcType: ArcType.FULL,
          arcBackgroundColor: Colors.transparent,
          radius: 50.0.r,
          lineWidth: 12.0.w,
          percent: 0.7,
          center: Text("70%", style: FontsStyle.font18BoldWhite),
          footer: Text("Bills", style: FontsStyle.font18BoldWhite),
          progressColor: Colors.blue,
        ),
      ],
    );
  }
}
