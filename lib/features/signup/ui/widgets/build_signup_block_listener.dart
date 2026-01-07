import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/routing/routs.dart';
import '../../logic/cubit/signup_cubit.dart';

class BuildSignupBlockListener extends StatelessWidget {
  const BuildSignupBlockListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignupCubit, SignupState>(
      listenWhen: (previous, current) => previous != current,
      listener: (context, state) {
        if (state is SignupLoadingState) {
          showDialog(
            context: context,
            builder: (context) => Center(child: CircularProgressIndicator()),
          );
        } else if (state is SignupErrorState) {
          Navigator.pop(context);
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text('error in signup')));
        } else {
          Navigator.pop(context);
          Navigator.pushReplacementNamed(context, Routs.home);
        }
      },
      child: Container(),
    );
  }
}
