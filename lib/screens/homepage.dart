import 'package:eas/authentication/authentications.dart';
import 'package:eas/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyColors.mainColor,
        title: Text("Emergency", style: GoogleFonts.cinzel()),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Center(child: InkWell(onTap: () {}, child: emWidget("Police"))),
          Center(
            child: InkWell(
              onTap: () {},
              child: emWidget("Ambulace"),
            ),
          ),
          Center(
            child: InkWell(
              onTap: () {},
              child: emWidget("Fire force"),
            ),
          ),
        ],
      ),
    );
  }
}

Widget emWidget(String type) {
  return Container(
      width: 135,
      height: 135,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(70),
        border: Border.all(color: MyColors.mainColor, width: 3),
      ),
      child: Center(
        child: Text(
          type,
          style: GoogleFonts.lato(
            fontWeight: FontWeight.w900,
            fontSize: 20,
            color: MyColors.mainColor,
          ),
        ),
      ));
}
