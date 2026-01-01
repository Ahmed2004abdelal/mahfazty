import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mahfazty/core/routing/routs.dart';
import 'package:mahfazty/features/login/logic/cubit/login_cubit.dart';

class BuildBlockListener extends StatelessWidget {
  const BuildBlockListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      listenWhen: (previous, current) => previous != current,
      listener: (context, state) {
        if (state is LoginLoadingState) {
          showDialog(
            context: context,
            builder: (context) => Center(child: CircularProgressIndicator()),
          );
        } else if (state is LoginErrorState) {
          Navigator.pop(context);
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text("Error Logging in"),
              backgroundColor: Colors.red,
            ),
          );
        } else {
          Navigator.pop(context);
          Navigator.pushReplacementNamed(context, Routs.home);
        }
      },
      child: SizedBox.shrink(),
    );
  }
}
