// ignore_for_file: sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:levelup/util/color.dart';
import 'package:levelup/util/decoration.dart';
import 'package:levelup/util/images.dart';
import 'package:levelup/view/base/CustomButton.dart';
import 'package:levelup/view/screens/Auth/CreateNewAccount/weighIn.dart';

class GetStartedCreateAccount extends StatelessWidget {
  const GetStartedCreateAccount({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width * 0.01;
    double _height = MediaQuery.of(context).size.height * 0.01;
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
        fit: BoxFit.cover,
        image: AssetImage(bgimage11),
      )),
      child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Container(
            margin: EdgeInsets.only(top: 70),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
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
                    "Your daily calorie\n requirement is\n 1500 calories.",
                    textAlign: TextAlign.center,
                    style: textStyleHeading,
                  ),
                  SizedBox(
                    height: _height * 4,
                  ),
                  Text(
                    "Your macro breakdown is:",
                    textAlign: TextAlign.center,
                    style: textStylesubHeading,
                  ),
                  SizedBox(
                    height: _height * 4,
                  ),
                  Container(
                    width: _width * 90,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Container(
                            height: _height * 12,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: _height * 2,
                                ),
                                Text(
                                  "33%",
                                  style: GoogleFonts.mulish(
                                      fontSize: 22,
                                      fontWeight: FontWeight.w800,
                                      color: white),
                                ),
                                Text(
                                  "Protein",
                                  style: GoogleFonts.mulish(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700,
                                      color: white),
                                )
                              ],
                            ),
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(purpleBox))),
                          ),
                        ),
                        SizedBox(
                          width: _width * 5,
                        ),
                        Expanded(
                          child: Container(
                            height: _height * 12,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: _height * 2,
                                ),
                                Text(
                                  "33%",
                                  style: GoogleFonts.mulish(
                                      fontSize: 22,
                                      fontWeight: FontWeight.w800,
                                      color: white),
                                ),
                                Text(
                                  "Carbs",
                                  style: GoogleFonts.mulish(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700,
                                      color: white),
                                )
                              ],
                            ),
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(greenBox))),
                          ),
                        ),
                        SizedBox(
                          width: _width * 5,
                        ),
                        Expanded(
                          child: Container(
                            height: _height * 12,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: _height * 2,
                                ),
                                Text(
                                  "33%",
                                  style: GoogleFonts.mulish(
                                      fontSize: 22,
                                      fontWeight: FontWeight.w800,
                                      color: white),
                                ),
                                Text(
                                  "Fat",
                                  style: GoogleFonts.mulish(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700,
                                      color: white),
                                )
                              ],
                            ),
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(yellowBox))),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    height: _height * 4,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: _width * 5),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "You can change these values at any time from your profile page in the main menu.",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.mulish(
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                            color: lightgrey),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Center(
                    child: CustomButton(
                        width: _width * 90,
                        height: _height * 7,
                        lableText: "Get Started",
                        onPressed: () {}),
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
