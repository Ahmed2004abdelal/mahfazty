import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mahfazty/features/login/logic/cubit/login_cubit.dart';
import 'package:mahfazty/features/login/ui/widgets/build_block_listener.dart';
import 'package:mahfazty/features/login/ui/widgets/dont_have_account.dart';
import 'package:mahfazty/features/login/ui/widgets/email_and_password.dart';
import 'package:mahfazty/features/login/ui/widgets/terms_and_conditions.dart';
import 'package:mahfazty/features/signup/logic/cubit/signup_cubit.dart';
import 'package:mahfazty/features/signup/ui/widgets/build_signup_block_listener.dart';
import 'package:mahfazty/features/signup/ui/widgets/singup_form_field.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/theme/fonts_style.dart';
import '../../../../core/theme/my_colors.dart';
import '../../../../core/widgets/my_button_gradient.dart';
import '../../../../core/widgets/my_text_form_field.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: MyColors.blackColor,
      appBar: AppBar(
        backgroundColor: MyColors.blackColor,
        leading: IconButton(
          onPressed: () {},
          icon: Icon(Icons.arrow_back_ios_new, color: Colors.white),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsetsGeometry.symmetric(horizontal: 20.0.w),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // verticalSpace(120),
                SingupFormField(),

                verticalSpace(20),
                TermsAndConditions(),
                verticalSpace(30),
                MyButtonGradient(
                  text: "Login",
                  textstyle: FontsStyle.font18BoldWhite,
                  colors: [MyColors.orangeColor, MyColors.yellowColor],
                  height: 60,
                  width: double.infinity,
                  function: () {
                    validateThensignup(context);
                  },
                ),
                // verticalSpace(20),
                // verticalSpace(35),
                // DontHaveAccount(),
                BuildSignupBlockListener(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void validateThensignup(BuildContext context) {
    if (context.read<SignupCubit>().formKey.currentState!.validate()) {
      context.read<SignupCubit>().signup();
    }
  }
}
