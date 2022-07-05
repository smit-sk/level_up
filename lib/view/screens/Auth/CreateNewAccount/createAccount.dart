import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
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
  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width * 0.01;
    double _height = MediaQuery.of(context).size.height * 0.01;
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
        fit: BoxFit.cover,
        image: AssetImage(bgimage3),
        colorFilter:
            ColorFilter.mode(primary.withOpacity(0.25), BlendMode.dstATop),
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
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "Enter Value";
                                  } else {
                                    return "";
                                  }
                                },
                                onChanged: (value) {
                                  setState(() {
                                    //this.password = value;
                                  });
                                },
                                isObscureText: false,
                                isError: false),
                            SizedBox(
                              width: _width * 5,
                            ),
                            CustomTextFeild(
                                height: _height * 7,
                                width: _width * 42.5,
                                lableText: "Surname",
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "Enter Value";
                                  } else {
                                    return "";
                                  }
                                },
                                onChanged: (value) {
                                  setState(() {
                                    //this.password = value;
                                  });
                                },
                                isObscureText: false,
                                isError: false),
                          ],
                        ),
                        Container(
                          width: _width * 85,
                          child: Row(
                            children: [
                              ErrorTextField(
                                  isError: false,
                                  width: _width * 40,
                                  height: 20,
                                  errorText: "Enter First Name"),
                              SizedBox(
                                width: _width * 5,
                              ),
                              ErrorTextField(
                                  isError: false,
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
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Enter Value";
                              } else {
                                return "";
                              }
                            },
                            onChanged: (value) {
                              setState(() {
                                //this.password = value;
                              });
                            },
                            isObscureText: false,
                            isError: false),
                        ErrorTextField(
                            isError: false,
                            width: _width * 85,
                            height: 20,
                            errorText: "Enter valid email address "),
                        CustomTextFeild(
                            height: _height * 7,
                            width: _width * 90,
                            lableText: "New Password",
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Enter Value";
                              } else {
                                return "";
                              }
                            },
                            onChanged: (value) {
                              setState(() {
                                //this.password = value;
                              });
                            },
                            isObscureText: true,
                            isError: false),
                        ErrorTextField(
                            isError: false,
                            width: _width * 85,
                            height: 20,
                            errorText: "Enter valid password"),
                        CustomTextFeild(
                            height: _height * 7,
                            width: _width * 90,
                            lableText: "Confirm Password",
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Enter Value";
                              } else {
                                return "";
                              }
                            },
                            onChanged: (value) {
                              setState(() {
                                //this.password = value;
                              });
                            },
                            isObscureText: true,
                            isError: false),
                        ErrorTextField(
                            isError: false,
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
                    lableText: "Sign uo",
                    onPressed: () {
                      Get.to(() => Step01CreateAccount());
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
                  Text(
                    "Sign In",
                    style: GoogleFonts.mulish(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w700),
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
