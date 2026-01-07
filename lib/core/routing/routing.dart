import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../features/home/ui/screens/home_screen.dart';
import '../../features/login/logic/cubit/login_cubit.dart';
import '../../features/login/ui/screen/login_screen.dart';
import '../../features/signup/logic/cubit/signup_cubit.dart';
import '../../features/signup/ui/screens/signup_screen.dart';
import '../network/firebase_helper.dart';
import 'routs.dart';

class Routing {
  Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routs.login:
        return MaterialPageRoute(
          builder: (_) => BlocProvider<LoginCubit>(
            create: (context) => LoginCubit(FirebaseHelper()),
            child: const LoginScreen(),
          ),
        );
      case Routs.signup:
        return MaterialPageRoute(
          builder: (_) => BlocProvider<SignupCubit>(
            create: (context) => SignupCubit(FirebaseHelper()),
            child: const SignupScreen(),
          ),
        );
      case Routs.home:
        return MaterialPageRoute(
          builder: (_) => BlocProvider<SignupCubit>(
            create: (context) => SignupCubit(FirebaseHelper()),
            child: const HomeScreen(),
          ),
        );
      default:
        return MaterialPageRoute(builder: (_) => const NoRouting());
    }
  }
}

class NoRouting extends StatelessWidget {
  const NoRouting({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Text(
          'No Route Found',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ),
    );
  }
}
