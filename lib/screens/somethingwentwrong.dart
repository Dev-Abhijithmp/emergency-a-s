import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SomethingWentWrong extends StatelessWidget {
  const SomethingWentWrong({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Something Went wrong ",style: GoogleFonts.lato(fontSize: 15),),
      ),
    );
  }
}
