import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mahfazty/core/helpers/spacing.dart';
import 'package:mahfazty/core/theme/fonts_style.dart';
import 'package:mahfazty/core/widgets/my_text_form_field.dart';
import 'package:mahfazty/features/login/logic/cubit/login_cubit.dart';
import 'package:mahfazty/features/signup/logic/cubit/signup_cubit.dart';

class SingupFormField extends StatefulWidget {
  const SingupFormField({super.key});

  @override
  State<SingupFormField> createState() => _SingupFormFieldState();
}

class _SingupFormFieldState extends State<SingupFormField> {
  bool isObscure1 = true;
  bool isObscure2 = true;
  late TextEditingController nameController;
  late TextEditingController emailController;
  late TextEditingController passwordController;
  late TextEditingController passwordconfirmationController;

  @override
  void initState() {
    super.initState();
    nameController = context.read<SignupCubit>().nameController;
    emailController = context.read<SignupCubit>().emailController;
    passwordController = context.read<SignupCubit>().passwordController;
    passwordconfirmationController = context
        .read<SignupCubit>()
        .passwordConfirmationController;
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<SignupCubit>().formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Welcome To Mahfazty!", style: FontsStyle.font24SemiBoldWhite),
          verticalSpace(20),
          Text("name", style: FontsStyle.font18BoldWhite),
          verticalSpace(10),
          MyTextFormField(
            val: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your name';
              }
              return null;
            },
            controller: emailController,
            hintText: "Enter your name",
            isObscure: false,
            autofocus: true,
          ),
          verticalSpace(20),
          Text("Email", style: FontsStyle.font18BoldWhite),
          verticalSpace(10),
          MyTextFormField(
            val: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your email';
              }
              return null;
            },
            controller: emailController,
            hintText: "Enter your E-mail",
            isObscure: false,
            autofocus: true,
          ),
          verticalSpace(20),
          Text("password", style: FontsStyle.font18BoldWhite),
          verticalSpace(10),
          MyTextFormField(
            val: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your password';
              }
              return null;
            },
            controller: passwordController,
            hintText: "Enter your password",
            isObscure: isObscure1,
            suffixIcon: IconButton(
              onPressed: () {
                setState(() {
                  isObscure1 = !isObscure1;
                });
              },
              icon: isObscure1
                  ? Icon(Icons.visibility)
                  : Icon(Icons.visibility_off),
            ),
          ),
          verticalSpace(20),
          Text("password confirmation", style: FontsStyle.font18BoldWhite),
          verticalSpace(10),
          MyTextFormField(
            val: (value) {
              if (value == null || value.isEmpty) {
                return 'Please re-enter your password';
              } else if (passwordController != passwordconfirmationController) {
                return 'the passwords dont match';
              }
              return null;
            },
            controller: passwordController,
            hintText: "Re-enter your password",
            isObscure: isObscure2,
            suffixIcon: IconButton(
              onPressed: () {
                setState(() {
                  isObscure2 = !isObscure2;
                });
              },
              icon: isObscure2
                  ? Icon(Icons.visibility)
                  : Icon(Icons.visibility_off),
            ),
          ),
        ],
      ),
    );
  }
}
