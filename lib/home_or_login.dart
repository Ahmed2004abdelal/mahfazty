import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'features/home/ui/screens/home_screen.dart';
import 'features/login/ui/screen/login_screen.dart';

class HomeOrLogin extends StatelessWidget {
  const HomeOrLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          User? user = snapshot.data as User?;
          if (user == null) {
            return LoginScreen();
          } else {
            return const HomeScreen();
          }
        }
        return CircularProgressIndicator();
      },
    );
  }
}
