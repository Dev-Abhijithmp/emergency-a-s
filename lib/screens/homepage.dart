import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eas/authentication/authentications.dart';
import 'package:eas/colors.dart';
import 'package:eas/functions/corefunctions.dart';
import 'package:eas/functions/geolocation.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:permission_handler/permission_handler.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

bool isEnabled = false;

class _HomeState extends State<Home> {
  List<Color> homecolor = [
    Colors.white,
    Colors.white,
    Colors.white,
    Colors.white,
  ];
  void changecolor(int index) {
    setState(() {
      homecolor[0] = Colors.white;
      homecolor[1] = Colors.white;
      homecolor[2] = Colors.white;
      homecolor[3] = Colors.white;
      homecolor[index] = Colors.red;
    });
  }

  void showfunctions() {
    setState(() {
      isEnabled = true;
    });
  }

  void hidefunctions() {
    setState(() {
      isEnabled = false;
    });
  }

  FirebaseFirestore firestore = FirebaseFirestore.instance;
  @override
  Widget build(BuildContext context) {
    Position p;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyColors.mainColor,
        title: Text("Emergency", style: GoogleFonts.cinzel()),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: FutureBuilder<QuerySnapshot>(
                future: firestore.collection('police').get(),
                builder: (context, AsyncSnapshot snapshot) {
                  if (snapshot.hasData == true) {
                    List<DocumentSnapshot> data = snapshot.data!.docs;
                    return InkWell(
                        onTap: () async {
                          changecolor(0);
                          await [
                            Permission.sms,
                            Permission.location,
                            Permission.phone
                          ].request();
                          p = await determinePosition();
                          DocumentSnapshot result = await findnearest(data, p);
                          print(result.toString());
                          print(p.latitude.toString());
                          sendmessage(result.get('number'),
                              "Hi there, there is an emergency over here http://www.google.com/maps/place/${p.latitude},${p.longitude}");
                          makecall(result.get('number'));
                        },
                        child: emWidget('Police'));
                  } else if (snapshot.hasError == true) {
                    return buttonerror();
                  } else {
                    return buttonloading();
                  }
                }),
          ),
          Center(
            child: FutureBuilder<QuerySnapshot>(
                future: firestore.collection('hospital').get(),
                builder: (context, AsyncSnapshot snapshot) {
                  if (snapshot.hasData == true) {
                    List<DocumentSnapshot> data = snapshot.data!.docs;
                    return InkWell(
                        onTap: () async {
                          changecolor(0);
                          await [
                            Permission.sms,
                            Permission.location,
                            Permission.phone
                          ].request();
                          p = await determinePosition();
                          DocumentSnapshot result = await findnearest(data, p);
                          print(result.toString());
                          print(p.latitude.toString());
                          sendmessage(result.get('number'),
                              "Hi there, there is an emergency over here http://www.google.com/maps/place/${p.latitude},${p.longitude}");
                          makecall(result.get('number'));
                        },
                        child: emWidget('Ambulance'));
                  } else if (snapshot.hasError == true) {
                    return buttonerror();
                  } else {
                    return buttonloading();
                  }
                }),
          ),
          Center(
            child: FutureBuilder<QuerySnapshot>(
                future: firestore.collection('fireforce').get(),
                builder: (context, AsyncSnapshot snapshot) {
                  if (snapshot.hasData == true) {
                    List<DocumentSnapshot> data = snapshot.data!.docs;
                    return InkWell(
                        onTap: () async {
                          changecolor(0);
                          await [
                            Permission.sms,
                            Permission.location,
                            Permission.phone
                          ].request();
                          p = await determinePosition();
                          DocumentSnapshot result = await findnearest(data, p);
                          print(result.toString());
                          print(p.latitude.toString());
                          sendmessage(result.get('number'),
                              "Hi there, there is an emergency over here http://www.google.com/maps/place/${p.latitude},${p.longitude}");
                          makecall(result.get('number'));
                        },
                        child: emWidget('Fireforce'));
                  } else if (snapshot.hasError == true) {
                    return buttonerror();
                  } else {
                    return buttonloading();
                  }
                }),
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

Widget buttonerror() {
  return Container(
    height: 135,
    width: 135,
    decoration: BoxDecoration(
        border: Border.all(color: Colors.red),
        borderRadius: BorderRadius.circular(70),
        color: MyColors.mainColor),
    child: Center(
      child: Text(
        "ERROR",
        style: GoogleFonts.lato(
          fontWeight: FontWeight.w900,
          fontSize: 20,
          color: MyColors.mainColor,
        ),
      ),
    ),
  );
}

Widget buttonloading() {
  return Container(
    height: 135,
    width: 135,
    decoration: BoxDecoration(
        border: Border.all(color: Colors.red),
        borderRadius: BorderRadius.circular(70),
        color: MyColors.mainColor),
    child: Center(
        child: CircularProgressIndicator(
      color: MyColors.mainColor,
      value: 3,
    )),
  );
}
