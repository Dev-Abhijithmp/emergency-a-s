import 'package:eas/authentication/authentications.dart';
import 'package:eas/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Profile",
          style: GoogleFonts.cinzel(),
        ),
        backgroundColor: MyColors.mainColor,
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 50,
          ),
          const ListTile(
            title: Text("Name"),
            subtitle: Text("test"),
          ),
          const ListTile(
            title: Text("Email"),
            subtitle: Text("test@gmail.com"),
          ),
          Spacer(),
          Center(
            child: OutlinedButton(
                style: ButtonStyle(
                  shape: MaterialStateProperty.all(
                    StadiumBorder(
                      side: BorderSide.merge(
                        BorderSide(color: MyColors.mainColor),
                        BorderSide(color: MyColors.mainColor),
                      ),
                    ),
                  ),
                ),
                onPressed: () {
                  signout(context);
                },
                child: Text(
                  "Sign out",
                  style: GoogleFonts.lato(color: MyColors.mainColor),
                )),
          ),
          const SizedBox(
            height: 100,
          )
        ],
      ),
    );
  }
}
