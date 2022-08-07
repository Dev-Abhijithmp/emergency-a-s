import 'package:eas/colors.dart';
import 'package:eas/functions/launchfunctions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({Key? key}) : super(key: key);

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  @override
  void initState() {
    onLaunch(context);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.mainColor,
      body: Center(
          child: NeumorphicText(
        "EH App",
        style: const NeumorphicStyle(
            color: Colors.white, shadowDarkColor: Colors.black),
        textStyle: NeumorphicTextStyle(fontSize: 25),
      )),
    );
  }
}
