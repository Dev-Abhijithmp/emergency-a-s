
import 'package:eas/screens/bottomnavigationbar.dart';
import 'package:eas/screens/homepage.dart';
import 'package:eas/screens/loginPage.dart';
import 'package:eas/screens/mainpage.dart';
import 'package:eas/screens/signuppage.dart';
import 'package:eas/screens/splashscreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized;
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        'register': (context) => const Signuppage(),
        'login': ((context) => LoginPage()),
        'main': ((context) => const Mainpage()),
        'home': (context) => Home(),
        'bottomnav':(context) => BottomNav(),
      },
      home: Splashscreen(),
    );
  }
}
