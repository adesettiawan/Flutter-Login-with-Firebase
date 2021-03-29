import 'package:firebase_auth/firebase_auth.dart';
import 'package:login/database_manager/database_manager.dart';

class AuthServices {
  static FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  static Future<FirebaseUser> register(
      String name, String email, String password, String phoneNumber) async {
    try {
      AuthResult result = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      FirebaseUser firebaseUser = result.user;

      // Code untuk terhubung kedalam firestore/database manager
      await DatabaseManager()
          .createUserData(name, phoneNumber, firebaseUser.uid);

      return firebaseUser;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  static Future<FirebaseUser> login(String email, String password) async {
    try {
      AuthResult result = await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);

      FirebaseUser firebaseUser = result.user;

      return firebaseUser;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  static Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }

  static Stream<FirebaseUser> get firebaseUserStream =>
      _firebaseAuth.onAuthStateChanged;
}
