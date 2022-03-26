import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class UserRepository {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final FacebookAuth _facebookAuth = FacebookAuth.instance;

  /*-------------------Authentication with Email-------------------*/
  Future<User> emailSignIn(
      {required String email, required String password}) async {
    try {
      final emailAuth = await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      return emailAuth.user!;
    } on FirebaseException catch (e) {
      throw e.message.toString();
    }
  }

  Future<User> emailSignUp(
      {required String email, required String password}) async {
    try {
      final emailAuth = await _firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
      return emailAuth.user!;
    } on FirebaseException catch (e) {
      throw e.message.toString();
    }
  }

  Future<void> signOutfromEmail() async {
    await _firebaseAuth.signOut();
  }

  /*-------------------Authentication with Google-------------------*/
  Future<User> googleSignIn() async {
    try {
      final googleUser = await _googleSignIn.signIn();
      if (googleUser != null) {
        final googleAuth = await googleUser.authentication;

        final credential = GoogleAuthProvider.credential(
          idToken: googleAuth.idToken,
          accessToken: googleAuth.accessToken,
        );

        await FirebaseAuth.instance.signInWithCredential(credential);
      }
      return googleUser as User;
    } on FirebaseException catch (e) {
      throw e.message.toString();
    }
  }

  Future<void> signOutfromGoogle() async {
    await _googleSignIn.disconnect();
    await _googleSignIn.signOut();
  }

  /*-------------------Authentication with Facebook-------------------*/
  Future<User> facebookSignIn() async {
    try {
      final result = await _facebookAuth.login();
      final credential =
          FacebookAuthProvider.credential(result.accessToken!.token);
      await FirebaseAuth.instance.signInWithCredential(credential);
      final user = result.accessToken as User;
      return user;
    } on FirebaseException catch (e) {
      throw e.message.toString();
    }
  }

  Future<void> signOutFromFacebook() async {
    await _facebookAuth.logOut();
  }
}
