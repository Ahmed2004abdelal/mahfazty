import 'package:flutter/material.dart';

import '../../../../core/theme/fonts_style.dart';

class TermsAndConditions extends StatelessWidget {
  const TermsAndConditions({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Text(
        'By continuing you agree to our Terms \n of use and Privacy Policy',
        style: FontsStyle.font13GreyW300,
        textAlign: TextAlign.center,
      ),
    );
  }
}
