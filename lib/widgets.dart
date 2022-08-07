import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'colors.dart';

SnackBar snb(String data) {
  return SnackBar(
    content: SizedBox(
      height: 30,
      child: Center(
        child: Text(
          data,
          style: GoogleFonts.lato(fontSize: 15, color: Colors.white),
        ),
      ),
    ),
  );
}
UnderlineInputBorder unborder() {
  return UnderlineInputBorder(borderSide: BorderSide(color: MyColors.bgColor));
}

UnderlineInputBorder focusedborder() {
  return const UnderlineInputBorder(
      borderSide: BorderSide(color: Colors.black));
}