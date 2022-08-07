import 'package:eas/colors.dart';
import 'package:eas/managedata/firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class Addtofirestore extends StatelessWidget {
  late final String category;
  Addtofirestore({Key? key, required this.category}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController controllerplace = TextEditingController();
    TextEditingController controllerlat = TextEditingController();
    TextEditingController controllerlong = TextEditingController();
    TextEditingController controllernumber = TextEditingController();
    return Scaffold(
      backgroundColor: MyColors.white,
      appBar: AppBar(
        title: Text(
          "Add " + category + " Data",
          style: GoogleFonts.signikaNegative(),
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 200,
            ),
            Container(
              height: 50,
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.symmetric(vertical: 5, horizontal: 30),
              child: TextFormField(
                controller: controllerplace,
                decoration: InputDecoration(
                  labelText: "Place",
                  focusedBorder: outlineInputBorder(),
                  fillColor: Colors.white,
                  filled: true,
                  border: outlineInputBorder(),
                  enabledBorder: outlineInputBorder(),
                  disabledBorder: outlineInputBorder(),
                ),
              ),
            ),
            Row(
              children: [
                Container(
                  height: 50,
                  width: MediaQuery.of(context).size.width * 0.40,
                  margin: EdgeInsets.only(left: 30, top: 5, bottom: 5),
                  child: TextFormField(
                    controller: controllerlat,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    decoration: InputDecoration(
                      labelText: "latitude",
                      focusedBorder: outlineInputBorder(),
                      fillColor: Colors.white,
                      filled: true,
                      border: outlineInputBorder(),
                      enabledBorder: outlineInputBorder(),
                      disabledBorder: outlineInputBorder(),
                    ),
                  ),
                ),
                Container(
                  height: 50,
                  width: MediaQuery.of(context).size.width * 0.40,
                  margin: EdgeInsets.only(left: 10, top: 5, bottom: 5),
                  child: TextFormField(
                    controller: controllerlong,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: "longitude",
                      focusedBorder: outlineInputBorder(),
                      fillColor: Colors.white,
                      filled: true,
                      border: outlineInputBorder(),
                      enabledBorder: outlineInputBorder(),
                      disabledBorder: outlineInputBorder(),
                    ),
                  ),
                ),
              ],
            ),
            Container(
              height: 70,
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.symmetric(vertical: 5, horizontal: 30),
              child: TextFormField(
                controller: controllernumber,
                keyboardType: TextInputType.phone,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                maxLength: 10,
                decoration: InputDecoration(
                  labelText: "phone",
                  prefixText: "+91",
                  focusedBorder: outlineInputBorder(),
                  fillColor: Colors.white,
                  filled: true,
                  border: outlineInputBorder(),
                  enabledBorder: outlineInputBorder(),
                  disabledBorder: outlineInputBorder(),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            InkWell(
              onTap: () async {
                if (controllernumber.text == "" ||
                    controllerlong.text == "" ||
                    controllerlat == "" ||
                    controllerplace == "") {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) => alert(context));
                } else {
                  int flag = await addtofirebase(
                      category,
                      controllerplace.text,
                      controllernumber.text,
                      double.parse(controllerlat.text),
                      double.parse(controllerlong.text));
                  if (flag == 0) {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) => success(context));
                  } else {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) => failed(context));
                  }
                }
              },
              child: Container(
                height: 50,
                width: 150,
                decoration: BoxDecoration(
                  color: MyColors.blue,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Center(
                  child: Text(
                    "Submit",
                    style: GoogleFonts.signikaNegative(),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

OutlineInputBorder outlineInputBorder() {
  return OutlineInputBorder(
      borderRadius: BorderRadius.circular(20),
      borderSide: BorderSide(color: MyColors.blue));
}

AlertDialog alert(context) {
  return AlertDialog(
    content: Text(
      "data cannot be null",
      style: GoogleFonts.signikaNegative(),
    ),
    actions: [
      TextButton(
        child: Text("OK"),
        onPressed: () {
          Navigator.pop(context);
        },
      )
    ],
  );
}

AlertDialog success(context) {
  return AlertDialog(
    content: Text(
      "Success..",
      style: GoogleFonts.signikaNegative(),
    ),
    actions: [
      TextButton(
        child: Text(
          "OK",
          style: GoogleFonts.signikaNegative(),
        ),
        onPressed: () {
          Navigator.pop(context);
        },
      )
    ],
  );
}

AlertDialog failed(context) {
  return AlertDialog(
    content: Text(
      "failedl",
      style: GoogleFonts.signikaNegative(),
    ),
    actions: [
      TextButton(
        child: Text(
          "OK",
          style: GoogleFonts.signikaNegative(),
        ),
        onPressed: () {
          Navigator.pop(context);
        },
      )
    ],
  );
}
