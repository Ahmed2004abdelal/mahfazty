import 'package:firebase_auth/firebase_auth.dart';

class FirebaseHelper {
  FirebaseAuth auth = FirebaseAuth.instance;

  Future<void> loginUser(String email, String password) async {
    await auth.signInWithEmailAndPassword(email: email, password: password);
  }

  Future<void> register(String email, String password) async {
    await auth.signInWithEmailAndPassword(email: email, password: password);
  }
}
