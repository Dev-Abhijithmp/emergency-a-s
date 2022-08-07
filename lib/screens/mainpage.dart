// ignore_for_file: file_names

import 'package:eas/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Mainpage extends StatelessWidget {
  const Mainpage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: MyColors.mainColor,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 100),
                child: Text(
                  "EAS",
                  style: GoogleFonts.lato(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            const SizedBox(
              height: 60,
            ),
            Center(
              child: InkWell(
                onTap: () {
                  Navigator.pushNamed(context, 'register');
                },
                splashColor: Colors.white,
                child: Container(
                  width: width * 0.8,
                  height: 50,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      border: Border.all(color: Colors.white)),
                  child: Center(
                    child: Text(
                      "Sign Up",
                      style: GoogleFonts.lato(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            Center(
              child: InkWell(
                splashColor: MyColors.mainColor,
                onTap: () {
                  Navigator.pushNamed(context, 'login');
                },
                child: Container(
                  width: width * 0.8,
                  height: 50,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: MyColors.bgColor),
                  child: Center(
                    child: Text(
                      "login",
                      style: GoogleFonts.lato(
                          color: MyColors.mainColor,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            )
          ],
        ));
  }
}
