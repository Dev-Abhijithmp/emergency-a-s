import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eas/screens/bottomnavigationbar.dart';
import 'package:eas/screens/loadingpage.dart';
import 'package:eas/screens/somethingwentwrong.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../admin/adminpage.dart';

class Switcher extends StatelessWidget {
  const Switcher({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    User? user = FirebaseAuth.instance.currentUser;
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    return FutureBuilder<DocumentSnapshot>(
      future: firestore.collection('users').doc(user!.uid).get(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasError) {
          return SomethingWentWrong();
        } else if (snapshot.connectionState == ConnectionState.waiting) {
          return Loading();
        } else {
          DocumentSnapshot doc = snapshot.data;

          if (doc.get('role') == "admin") {
            return const Adminpage();
          } else {
            return const BottomNav();
          }
        }
      },
    );
  }
}
