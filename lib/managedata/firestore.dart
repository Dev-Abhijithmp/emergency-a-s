import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

FirebaseFirestore firestore = FirebaseFirestore.instance;
FirebaseAuth usr = FirebaseAuth.instance;
String usrid = usr.currentUser!.uid;
Future<void> adduserdata(String email, String name) async {
  try {
    await firestore.collection("users").doc(usrid).set({
      'name': name,
      'email': email,
      'role': "user",
    });
  } on FirebaseException catch (e) {
    if (kDebugMode) {
      print(e.toString());
    }
  }
}

Future<int> addtofirebase(String category, String place, String number,
    double latitude, double longitude) async {
  try {
    await firestore.collection(category).doc(number).set({
      'place': place,
      'number': number,
      'loc': GeoPoint(latitude, longitude)
    });
    return 0;
  } on FirebaseException catch (e) {
    print(e.toString());
    return 1;
  }
}

Future<int> removefromfirebase(String phone, String category) async {
  try {
    await firestore.collection(category).doc(phone).delete();
    return 0;
  } on FirebaseException catch (e) {
    print(e.toString());
    return 1;
  }
}
