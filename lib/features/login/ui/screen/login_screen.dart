import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/theme/fonts_style.dart';
import '../../../../core/theme/my_colors.dart';
import '../../../../core/widgets/my_button_gradient.dart';
import '../../logic/cubit/login_cubit.dart';
import '../widgets/build_block_listener.dart';
import '../widgets/dont_have_account.dart';
import '../widgets/email_and_password.dart';
import '../widgets/terms_and_conditions.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: MyColors.blackColor,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsetsGeometry.symmetric(horizontal: 20.0.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              verticalSpace(150),

              EmailAndPassword(),
              verticalSpace(20),
              Align(
                alignment: Alignment.centerRight,
                child: Text(
                  "Forgot Password?",
                  style: FontsStyle.font18BoldWhite,
                ),
              ),
              verticalSpace(50),
              MyButtonGradient(
                text: "Login",
                textstyle: FontsStyle.font18BoldWhite,
                colors: [MyColors.orangeColor, MyColors.yellowColor],
                height: 60,
                width: double.infinity,
                function: () {
                  validateThenLogin(context);
                },
              ),
              verticalSpace(20),
              TermsAndConditions(),
              verticalSpace(35),
              DontHaveAccount(),
              BuildBlockListener(),
            ],
          ),
        ),
      ),
    );
  }

  void validateThenLogin(BuildContext context) {
    if (context.read<LoginCubit>().formKey.currentState!.validate()) {
      context.read<LoginCubit>().login();
    }
  }
}
