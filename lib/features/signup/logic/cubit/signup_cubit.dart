import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mahfazty/core/network/firebase_helper.dart';
import 'package:meta/meta.dart';

part 'signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey();
  final TextEditingController passwordConfirmationController =
      TextEditingController();
  final FirebaseHelper firebaseHelper;
  SignupCubit(this.firebaseHelper) : super(SignupInitial());

  signup() async {
    emit(SignupLoadingState());
    try {
      await firebaseHelper.register(
        emailController.text.trim(),
        passwordController.text.trim(),
      );
    } catch (e) {
      emit(SignupErrorState(errorMessage: e.toString()));
    }
  }
}
