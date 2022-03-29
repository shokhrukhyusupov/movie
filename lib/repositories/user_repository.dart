import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';

class UserRepository {
  final CollectionReference _collectionReference =
      FirebaseFirestore.instance.collection('users');
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final FacebookAuth _facebookAuth = FacebookAuth.instance;
  final _storage = const FlutterSecureStorage();

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
      final user = _firebaseAuth.currentUser;
      if (user != null) {
        await user.sendEmailVerification();
        Timer.periodic(const Duration(seconds: 1), (timer) async {
          await user.reload();
          final emailVerified = _firebaseAuth.currentUser!.emailVerified;
          if (timer.tick > 120) {
            user.delete();
            timer.cancel();
          } else if (emailVerified) {
            await _collectionReference.doc(user.uid).set({
              'uid': user.uid,
              'email': user.email,
              'displayName': user.displayName,
              'photoUrl': user.photoURL,
            });
            timer.cancel();
          }
        });
      }
      return emailAuth.user!;
    } on FirebaseException catch (e) {
      throw e.message.toString();
    }
  }

  Future<void> signOutfromEmail() async {
    await _firebaseAuth.signOut();
    _storage.delete(key: 'token');
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
        final uid = _firebaseAuth.currentUser!.uid;
        await _collectionReference.doc(uid).set({
          'uid': uid,
          'email': googleUser.email,
          'displayName': googleUser.displayName,
          'photoUrl': googleUser.photoUrl,
        });
        _storage.write(key: 'token', value: uid);
      }
      return googleUser as User;
    } on FirebaseException catch (e) {
      throw e.message.toString();
    }
  }

  Future<void> signOutfromGoogle() async {
    await _googleSignIn.disconnect();
    await _googleSignIn.signOut();
    _storage.delete(key: 'token');
  }

  /*-------------------Authentication with Facebook-------------------*/
  Future<User> facebookSignIn() async {
    try {
      final result = await _facebookAuth.login();
      final credential =
          FacebookAuthProvider.credential(result.accessToken!.token);
      await FirebaseAuth.instance.signInWithCredential(credential);
      final user = result.accessToken as User;
      if (result.accessToken != null) {
        await FirebaseAuth.instance.signInWithCredential(credential);
        final uid = _firebaseAuth.currentUser!.uid;
        await _collectionReference.doc(uid).set({
          'uid': uid,
          'email': user.email,
          'displayName': user.displayName,
          'photoUrl': user.photoURL,
        });
        _storage.write(key: 'token', value: uid);
      }
      return user;
    } on FirebaseException catch (e) {
      throw e.message.toString();
    }
  }

  Future<void> signOutFromFacebook() async {
    await _facebookAuth.logOut();
    _storage.delete(key: 'token');
  }
}
