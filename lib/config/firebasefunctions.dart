import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

class Auth {
  final auth = FirebaseAuth.instanceFor(app: Firebase.app());

  Future signInUser(String email, String password) async {
    try {
      await auth.signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      if (kDebugMode) {
        print(e.code);
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

  Future googleLogIn() async {
    try {
      final google = GoogleAuthProvider();

      User? credentials;

      if (kIsWeb) {
        credentials =
            await auth.signInWithPopup(google).then((cred) => cred.user!);
      } else {
        credentials =
            await auth.signInWithProvider(google).then((cred) => cred.user!);
      }

      if (credentials != null) {
        Firestore().createUser(
            credentials.email!, credentials.displayName!, credentials.uid);
      }
    } on FirebaseAuthException catch (e) {
      if (kDebugMode) {
        print(e.code);
      }
    }
  }

  Future registerUser(String name, String email, String password) async {
    try {
      final credential = await auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((value) => value);
      await auth.currentUser!.updateDisplayName(name);
      Firestore().createUser(email, name, credential.user!.uid);

      await auth.signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      if (kDebugMode) {
        print(e.code);
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

  Future<void> signOut() async {
    try {
      await auth.signOut();
    } on FirebaseAuthException catch (e) {
      if (kDebugMode) {
        print(e.code);
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

  Future<Map<String, dynamic>> getUserDetails() async {
    try {
      final userData = await Firestore()
          .db
          .collection("users")
          .doc(auth.currentUser!.uid)
          .get()
          .then((value) => value.data() as Map<String, dynamic>);
      return userData;
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      throw Exception("error: $e");
    }
  }
}

class Firestore {
  final db = FirebaseFirestore.instanceFor(app: Firebase.app());

  void createUser(String email, String name, String id) async {
    await db.collection("users").doc(id).set({
      "email": email,
      "name": name,
      "id": id,
    });
  }
}
