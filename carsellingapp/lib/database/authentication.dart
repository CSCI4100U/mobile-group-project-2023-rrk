import 'package:firebase_auth/firebase_auth.dart';

// database user authentication

class Authentication{ // Ro
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  User? get currentUser => _firebaseAuth.currentUser;

  Stream<User?> get authStateChanges => _firebaseAuth.authStateChanges();

  Future<void> signin({required String email, password}) async{
    await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
  }

    Future<void> signup({required String email, password}) async{
    await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
  }

  Future<void> signout() async{
    await _firebaseAuth.signOut();
  }

}