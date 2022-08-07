import 'package:eas/managedata/firestore.dart';
import 'package:eas/widgets.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

FirebaseAuth auth = FirebaseAuth.instance;
Stream<User?> changesign = auth.authStateChanges();

Future<void> signinemail(
    String email, String password, BuildContext context) async {
  try {
    UserCredential userCredential =
        await auth.signInWithEmailAndPassword(email: email, password: password);
    if (auth.currentUser != null) {
      // ignore: use_build_context_synchronously
      Navigator.pushNamedAndRemoveUntil(context, 'bottomnav', (route) => false);
    }

    print(userCredential.toString());
  } on FirebaseAuthException catch (e) {
    print(e.toString());
    ScaffoldMessenger.of(context).showSnackBar(snb(e.message!));
  }
}

void signout(context) async {
  auth.signOut().then((value) =>
      Navigator.pushNamedAndRemoveUntil(context, 'main', (route) => false));
  print("Signed out");
}

Future<void> register(
    String email, String password, String name, BuildContext context) async {
  try {
    await auth.createUserWithEmailAndPassword(email: email, password: password);
    await adduserdata(email, name).whenComplete(
      () =>
          Navigator.pushNamedAndRemoveUntil(context, 'home', (route) => false),
    );
    print('registration succesful');
  } on FirebaseAuthException catch (e) {
    print("registration error");
    print(e.toString());
    ScaffoldMessenger.of(context).showSnackBar(snb(e.message!));
  }
}

Future<void> sendpassreset(String email, context) async {
  try {
    await auth.sendPasswordResetEmail(email: email);
  } on FirebaseException catch (e) {
    print(e.toString());
    ScaffoldMessenger.of(context).showSnackBar(snb(e.message!));
  }
}
