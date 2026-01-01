import 'package:flutter/material.dart';
import 'package:mahfazty/core/routing/routs.dart';
import 'package:mahfazty/core/theme/fonts_style.dart';

class DontHaveAccount extends StatelessWidget {
  const DontHaveAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('Don\'t have an account?', style: FontsStyle.font13WhiteW300),
        TextButton(
          onPressed: () {
            Navigator.pushNamed(context, Routs.signup);
          },
          child: Text('Signup'),
        ),
      ],
    );
  }
}
