// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:levelup/helper/routeHelper.dart';
import 'package:levelup/util/color.dart';
import 'package:levelup/util/decoration.dart';
import 'package:levelup/util/images.dart';
import 'package:levelup/view/base/CustomButton.dart';
import 'package:levelup/view/base/CustomTextField.dart';
import 'package:levelup/view/base/ErrorTextField.dart';
import 'package:levelup/view/screens/Auth/CreateNewAccount/step01CreateAccount.dart';

class CreateAccount extends StatefulWidget {
  const CreateAccount({Key? key}) : super(key: key);

  @override
  State<CreateAccount> createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  String? email;
  bool isErrorEmail = false;
  String? fname;
  bool isErrorFname = false;
  String? surname;
  bool isErrorSurname = false;
  String? password;
  bool isErrorPassword = false;
  String? cpassword;
  bool isErrorCPassword = false;

  String errorText = "Enter valid";

  bool validateForm() {
    bool fnameValid = fname != null
        ? fname!.isNotEmpty
            ? true
            : false
        : false;
    bool surnameValid = surname != null
        ? surname!.isNotEmpty
            ? true
            : false
        : false;
    bool emailValid = email != null
        ? email!.isNotEmpty
            ? RegExp(
                    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                .hasMatch(email!)
            : false
        : false;
    bool passwordValid = password != null
        ? password!.isNotEmpty
            ? true
            : false
        : false;
    bool cpasswordvalid = cpassword != null
        ? cpassword!.isNotEmpty
            ? cpassword == password
                ? true
                : false
            : false
        : false;

    if (fnameValid) {
      setState(() {
        isErrorFname = false;
      });
    } else {
      setState(() {
        isErrorFname = true;
      });
    }

    setState(() {
      if (surnameValid) {
        isErrorSurname = false;
      } else {
        isErrorSurname = true;
      }
    });

    setState(() {
      if (emailValid) {
        isErrorEmail = false;
      } else {
        isErrorEmail = true;
      }
    });
    setState(() {
      if (passwordValid) {
        isErrorPassword = false;
      } else {
        isErrorPassword = true;
      }
    });
    setState(() {
      if (cpasswordvalid) {
        isErrorCPassword = false;
      } else {
        isErrorCPassword = true;
      }
    });

    return fnameValid &&
        surnameValid &&
        emailValid &&
        passwordValid &&
        cpasswordvalid;
  }

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width * 0.01;
    double _height = MediaQuery.of(context).size.height * 0.01;
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
        fit: BoxFit.cover,
        image: AssetImage(bgimage3),
        
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
                    "Create an account",
                    style: textStyleHeading,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    "It's quick and easy",
                    style: textStylesubHeading,
                  ),
                  SizedBox(
                    height: _height * 3,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: _width * 5),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            CustomTextFeild(
                                height: _height * 7,
                                width: _width * 42.5,
                                lableText: "First Name",
                                onChanged: (value) {
                                  setState(() {
                                    this.fname = value;
                                  });
                                },
                                isObscureText: false,
                                isError: isErrorFname),
                            SizedBox(
                              width: _width * 5,
                            ),
                            CustomTextFeild(
                                height: _height * 7,
                                width: _width * 42.5,
                                lableText: "Surname",
                                onChanged: (value) {
                                  setState(() {
                                    this.surname = value;
                                  });
                                },
                                isObscureText: false,
                                isError: isErrorSurname),
                          ],
                        ),
                        Container(
                          width: _width * 85,
                          child: Row(
                            children: [
                              ErrorTextField(
                                  isError: isErrorFname,
                                  width: _width * 40,
                                  height: 20,
                                  errorText: "Enter First Name"),
                              SizedBox(
                                width: _width * 5,
                              ),
                              ErrorTextField(
                                  isError: isErrorSurname,
                                  width: _width * 40,
                                  height: 20,
                                  errorText: "Enter Surname"),
                            ],
                          ),
                        ),
                        CustomTextFeild(
                            height: _height * 7,
                            width: _width * 90,
                            lableText: "Email Address",
                            onChanged: (value) {
                              setState(() {
                                this.email = value;
                              });
                            },
                            isObscureText: false,
                            isError: isErrorEmail),
                        ErrorTextField(
                            isError: isErrorEmail,
                            width: _width * 85,
                            height: 20,
                            errorText: "Enter Surname"),
                        CustomTextFeild(
                            height: _height * 7,
                            width: _width * 90,
                            lableText: "New Password",
                            onChanged: (value) {
                              setState(() {
                                this.password = value;
                              });
                            },
                            isObscureText: true,
                            isError: isErrorPassword),
                        ErrorTextField(
                            isError: isErrorPassword,
                            width: _width * 85,
                            height: 20,
                            errorText: "Enter valid password"),
                        CustomTextFeild(
                            height: _height * 7,
                            width: _width * 90,
                            lableText: "Confirm Password",
                            onChanged: (value) {
                              setState(() {
                                this.cpassword = value;
                              });
                            },
                            isObscureText: true,
                            isError: isErrorCPassword),
                        ErrorTextField(
                            isError: isErrorCPassword,
                            width: _width * 85,
                            height: 20,
                            errorText: "Enter valid confirm Password"),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: _height * 3,
                  ),
                  CustomButton(
                    width: _width * 90,
                    height: _height * 7,
                    lableText: "Sign up",
                    onPressed: () {
                      validateForm()
                          ? Get.toNamed(
                              RouteHelper.getStep01CreateAccountRoute())
                          : null;
                    },
                  ),
                  SizedBox(
                    height: _height * 5,
                  ),
                  Text(
                    "Already have an account?",
                    style: GoogleFonts.mulish(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.toNamed(RouteHelper.getSIgnInRoute());
                    },
                    child: Text(
                      "Sign In",
                      style: GoogleFonts.mulish(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
