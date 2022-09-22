import 'package:eas/admin/adddata.dart';
import 'package:eas/admin/removedata.dart';
import 'package:eas/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../authentication/authentications.dart';

class Adminpage extends StatefulWidget {
  const Adminpage({Key? key}) : super(key: key);

  @override
  _AdminpageState createState() => _AdminpageState();
}

List<Color> adminhome = [
  MyColors.white,
  MyColors.white,
  MyColors.white,
  MyColors.white,
  MyColors.white,
  MyColors.white,
];

class _AdminpageState extends State<Adminpage> {
  @override
  Widget build(BuildContext context) {
    void chnagecolor(int index) {
      setState(() {
        adminhome[0] = MyColors.white;
        adminhome[1] = MyColors.white;
        adminhome[2] = MyColors.white;
        adminhome[3] = MyColors.white;
        adminhome[4] = MyColors.white;
        adminhome[5] = MyColors.white;
        adminhome[index] = MyColors.blue;
      });
    }

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: MyColors.white,
      appBar: AppBar(
        title: Text(
          "Admin",
          style: GoogleFonts.signikaNegative(),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "fireforce",
            style: GoogleFonts.signikaNegative(),
          ),
          SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              InkWell(
                onTap: () {
                  chnagecolor(0);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) =>
                              Addtofirestore(category: "fireforce")));
                },
                child: Container(
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                      color: adminhome[0],
                      borderRadius: BorderRadius.circular(50),
                      border: Border.all(color: MyColors.blue)),
                  child: Center(
                    child: Text(
                      "Add",
                      style: GoogleFonts.signikaNegative(),
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  chnagecolor(1);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) =>
                              Removefromfirestore(category: "fireforce")));
                },
                child: Container(
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                      color: adminhome[1],
                      borderRadius: BorderRadius.circular(50),
                      border: Border.all(color: MyColors.blue)),
                  child: Center(
                    child: Text(
                      "remove",
                      style: GoogleFonts.signikaNegative(),
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 30,
          ),
          Text(
            "Hospital",
            style: GoogleFonts.signikaNegative(),
          ),
          SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              InkWell(
                onTap: () {
                  chnagecolor(2);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) =>
                              Addtofirestore(category: "hospital")));
                },
                child: Container(
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                      color: adminhome[2],
                      borderRadius: BorderRadius.circular(50),
                      border: Border.all(color: MyColors.blue)),
                  child: Center(
                    child: Text(
                      "Add",
                      style: GoogleFonts.signikaNegative(),
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  chnagecolor(3);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) =>
                              Removefromfirestore(category: "hospital")));
                },
                child: Container(
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                      color: adminhome[3],
                      borderRadius: BorderRadius.circular(50),
                      border: Border.all(color: MyColors.blue)),
                  child: Center(
                    child: Text(
                      "remove",
                      style: GoogleFonts.signikaNegative(),
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 30,
          ),
          Text(
            "police",
            style: GoogleFonts.signikaNegative(),
          ),
          SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              InkWell(
                onTap: () {
                  chnagecolor(4);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) =>
                              Addtofirestore(category: "police")));
                },
                child: Container(
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                      color: adminhome[4],
                      borderRadius: BorderRadius.circular(50),
                      border: Border.all(color: MyColors.blue)),
                  child: Center(
                    child: Text(
                      "Add ",
                      style: GoogleFonts.signikaNegative(),
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  chnagecolor(5);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) =>
                              Removefromfirestore(category: "police")));
                },
                child: Container(
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                      color: adminhome[5],
                      borderRadius: BorderRadius.circular(50),
                      border: Border.all(color: MyColors.blue)),
                  child: Center(
                    child: Text(
                      "remove",
                      style: GoogleFonts.signikaNegative(),
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 30,
          ),
          InkWell(
            onTap: () {
              signout(context);
            },
            child: Container(
              height: 50,
              width: 100,
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(50),
              ),
              child: Center(
                child: Text(
                  "logout",
                  style: GoogleFonts.signikaNegative(),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
