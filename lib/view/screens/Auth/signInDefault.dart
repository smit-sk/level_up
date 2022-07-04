import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:levelup/util/color.dart';
import 'package:levelup/util/images.dart';
import 'package:levelup/view/base/CustomTextField.dart';

class SignInDefault extends StatefulWidget {
  const SignInDefault({Key? key}) : super(key: key);

  @override
  State<SignInDefault> createState() => _SignInDefaultState();
}

class _SignInDefaultState extends State<SignInDefault> {
  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width * 0.01;
    double _height = MediaQuery.of(context).size.height * 0.01;
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
        fit: BoxFit.cover,
        image: AssetImage(bgimage1),
        colorFilter:
            ColorFilter.mode(Colors.black.withOpacity(0.5), BlendMode.dstATop),
      )),
      child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Container(
            width: _width * 100,
            margin: EdgeInsets.only(top: 70),
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    logo,
                    scale: 4,
                  ),
                  SizedBox(
                    height: _height * 4,
                  ),
                  RichText(
                      text: const TextSpan(
                          text: "LEVEL UP ",
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: "Gotham",
                              fontSize: 26,
                              fontWeight: FontWeight.w700),
                          children: [
                        TextSpan(
                          text: "FITNESS",
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: "Gotham",
                              fontSize: 26,
                              fontWeight: FontWeight.w500),
                        )
                      ])),
                  SizedBox(
                    height: _height * 10,
                  ),
                  Text(
                    "Welcome Back!",
                    style: GoogleFonts.mulish(
                        color: Colors.white,
                        fontSize: 26,
                        fontWeight: FontWeight.w800),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    "Please sign in",
                    style: GoogleFonts.mulish(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    height: _height * 3,
                  ),
                  CustomTextFeild(
                      height: _height * 7,
                      width: _width * 80,
                      lableText: "Email Address",
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Enter Value";
                        } else {
                          return "";
                        }
                      },
                      onChanged: (value) {
                        setState(() {});
                      },
                      isObscureText: false),
                  SizedBox(
                    height: _height * 3,
                  ),
                  CustomTextFeild(
                      height: _height * 7,
                      width: _width * 80,
                      lableText: "Password",
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Enter Value";
                        } else {
                          return "";
                        }
                      },
                      onChanged: (value) {
                        setState(() {});
                      },
                      isObscureText: true),
                  SizedBox(
                    height: _height * 3,
                  ),
                  Text(
                    "Forgot password?",
                    style: GoogleFonts.mulish(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    height: _height * 5,
                  ),
                  Container(
                    width: _width * 80,
                    height: _height * 7,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all<Color>(primary),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                      side: BorderSide(color: primary)))),
                      child: Center(
                        child: Text(
                          "Sign In",
                          style: GoogleFonts.mulish(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          )),
    );
  }
}
