import 'package:eas/authentication/authentications.dart';
import 'package:eas/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../functions/validators.dart';
import '../widgets.dart';

class Signuppage extends StatefulWidget {
  const Signuppage({Key? key}) : super(key: key);

  @override
  State<Signuppage> createState() => _SignuppageState();
}

class _SignuppageState extends State<Signuppage> {
  final _formkey = GlobalKey<FormState>();
  final TextEditingController _namecontroller = TextEditingController();
  final TextEditingController _emailcontroller = TextEditingController();
  final TextEditingController _pass1Controller = TextEditingController();
  final TextEditingController _pass2controller = TextEditingController();
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: MyColors.mainColor,
      body: Form(
        key: _formkey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
                child: Text(
                  "Sign up",
                  textAlign: TextAlign.left,
                  style: GoogleFonts.lato(fontSize: 30),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
              child: TextFormField(
                controller: _namecontroller,
                validator: (val) => isName(val!),
                autovalidateMode: AutovalidateMode.disabled,
                decoration: InputDecoration(
                    labelText: "Name",
                    border: unborder(),
                    focusedBorder: focusedborder(),
                    enabledBorder: unborder()),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
              child: TextFormField(
                controller: _emailcontroller,
                validator: (val) => isEmail(val!),
                autovalidateMode: AutovalidateMode.disabled,
                decoration: InputDecoration(
                    labelText: "Email",
                    border: unborder(),
                    focusedBorder: focusedborder(),
                    enabledBorder: unborder()),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
              child: TextFormField(
                obscureText: true,
                validator: (value) => isPassword(value),
                controller: _pass1Controller,
                decoration: InputDecoration(
                    labelText: "Password",
                    border: unborder(),
                    enabledBorder: unborder(),
                    focusedBorder: focusedborder()),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
              child: TextFormField(
                obscureText: true,
                validator: (value) => isPassword(value),
                controller: _pass2controller,
                decoration: InputDecoration(
                    labelText: "verify password",
                    border: unborder(),
                    enabledBorder: unborder(),
                    focusedBorder: focusedborder()),
              ),
            ),
            const SizedBox(
              height: 100,
            ),
            loading
                ? const CircularProgressIndicator(
                    color: Colors.white,
                  )
                : Center(
                    child: InkWell(
                      onTap: () async {
                        if (_formkey.currentState!.validate()) {
                          setState(() {
                            loading = true;
                          });
                          if (_pass1Controller.text != _pass2controller.text) {
                            setState(() {
                              loading = false;
                            });
                            ScaffoldMessenger.of(context)
                                .showSnackBar(snb("passwords don't match"));
                          } else {
                            await register(
                                    _emailcontroller.text.trim(),
                                    _pass1Controller.text,
                                    _namecontroller.text.trim(),
                                    context)
                                .then((value) => Navigator.popAndPushNamed(
                                    context, 'signinout'));
                          }
                        }
                      },
                      child: Container(
                        width: width * 0.7,
                        height: 50,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: MyColors.bgColor),
                        child: Center(
                          child: Text(
                            "register",
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
        ),
      ),
    );
  }
}
