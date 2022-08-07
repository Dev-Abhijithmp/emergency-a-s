import 'package:eas/firebase_options.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';

import '../widgets.dart';

Future<void> onLaunch(context) async {
  ConnectivityResult connectionStatus =
      await (Connectivity().checkConnectivity());
  if (connectionStatus == ConnectivityResult.wifi ||
      connectionStatus == ConnectivityResult.mobile) {
    await Future.delayed(const Duration(seconds: 3));
    await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform);

    if (FirebaseAuth.instance.currentUser == null) {
      Navigator.popAndPushNamed(context, 'main');
    } else {
      Navigator.popAndPushNamed(context, 'bottomnav');
    }
  } else {
    ScaffoldMessenger.of(context)
        .showSnackBar(snb("please connect to internet"));
  }
  print("connection status");
  print(connectionStatus);
}
