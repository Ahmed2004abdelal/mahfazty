import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mahfazty/core/network/firebase_helper.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final FirebaseHelper firebaseHelper;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwodController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey();

  LoginCubit(this.firebaseHelper) : super(LoginInitial());

  login() async {
    emit(LoginLoadingState());
    try {
      await firebaseHelper
          .loginUser(emailController.text.trim(), passwodController.text.trim())
          .then((value) => emit(LoginSuccessState()));
    } catch (e) {
      emit(LoginErrorState(e.toString()));
    }
  }
}
