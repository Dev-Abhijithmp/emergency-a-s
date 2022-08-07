import 'package:eas/authentication/authentications.dart';
import 'package:eas/colors.dart';
import 'package:eas/functions/validators.dart';
import 'package:eas/screens/homepage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../widgets.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  final _formkey = GlobalKey<FormState>(debugLabel: "login form");
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
                padding: const EdgeInsets.all(20),
                child: Text(
                  "Login",
                  textAlign: TextAlign.left,
                  style: GoogleFonts.lato(fontSize: 30),
                ),
              ),
            ),
            const SizedBox(
              height: 140,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
              child: TextFormField(
                controller: emailController,
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
                controller: passwordController,
                decoration: InputDecoration(
                    labelText: "Password",
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
                          await signinemail(emailController.text.trim(),
                              passwordController.text, context);
                          setState(() {
                            loading = false;
                          });
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
        ),
      ),
    );
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    loading = false;

    super.dispose();
  }
}
