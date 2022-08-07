import 'package:eas/colors.dart';
import 'package:flutter/material.dart';

class Loading extends StatelessWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.bgColor,
      body: Center(
          child: CircularProgressIndicator(
        color: MyColors.mainColor,
      )),
    );
  }
}
