
import 'package:firebase_auth/firebase_auth.dart';
import 'package:logger/logger.dart';

class AuthService {
  final _auth = FirebaseAuth.instance;
  final logger = Logger();

  Future<User?> signup(String email, String password) async {
    try {
      final authCreditnal = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      if (authCreditnal.user != null) {
        logger.i("user Created Succefully");
        return authCreditnal.user!;
      }
    } on FirebaseAuthException catch (e) {
      logger.i(e.message!);
      rethrow;
    } catch (e) {
      logger.i(e.toString());
      rethrow;
    }
    return null;
  }

  Future<User?> login(String email, String password) async {
    try {
      final authCreditnal = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      if (authCreditnal.user != null) {
        logger.i("user Login Succefully");
        return authCreditnal.user!;
      }
    } on FirebaseAuthException catch (e) {
      logger.i(e.message!);
      rethrow;
    } catch (e) {
      logger.i(e.toString());
      rethrow;
    }
    return null;
  }

  Future<void> signOut() async {
    try {
      await _auth.signOut();
      logger.i("User Sign Out Succefully");
    } catch (e) {
      logger.i(e.toString());
    }
  }
}
