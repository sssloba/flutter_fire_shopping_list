import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  factory AuthService() {
    _singleton ??= AuthService._();
    return _singleton!;
  }

  AuthService._();
  static AuthService? _singleton;

  Future<void> loginWithEmail({
    required String email,
    required String password,
  }) async {
    await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password);
  }

  Future<void> signUpWithEmail({
    required String email,
    required String password,
  }) async {
    await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password);
  }

  Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
  }

  User? getUserInfo() {
    return FirebaseAuth.instance.currentUser;
  }

  bool get isUserLoggedIn => FirebaseAuth.instance.currentUser != null;
}
