// ignore_for_file: prefer_const_constructors, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:levelup/util/color.dart';
import 'package:levelup/util/decoration.dart';
import 'package:levelup/util/images.dart';
import 'package:levelup/view/base/CustomButton.dart';
import 'package:levelup/view/base/CustomRadioButton.dart';
import 'package:levelup/view/base/CustomTextField.dart';
import 'package:levelup/view/base/ErrorTextField.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class Step01CreateAccount extends StatefulWidget {
  const Step01CreateAccount({Key? key}) : super(key: key);

  @override
  State<Step01CreateAccount> createState() => _Step01CreateAccountState();
}

class _Step01CreateAccountState extends State<Step01CreateAccount> {
  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width * 0.01;
    double _height = MediaQuery.of(context).size.height * 0.01;
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
        fit: BoxFit.cover,
        image: AssetImage(bgimage4),
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
                    "Tell us about yourself",
                    style: textStyleHeading,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    "This info helps us to estimate\n your caloric needs",
                    textAlign: TextAlign.center,
                    style: textStylesubHeading,
                  ),
                  SizedBox(
                    height: _height * 4,
                  ),
                  Center(
                    child: Text(
                      "Step 1 of 5",
                      textAlign: TextAlign.center,
                      style: textStyleButton,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  LinearPercentIndicator(
                    alignment: MainAxisAlignment.center,
                    barRadius: Radius.circular(10),
                    width: _width * 30,
                    lineHeight: 10.0,
                    percent: 0.2,
                    backgroundColor: white,
                    progressColor: primary,
                  ),
                  SizedBox(
                    height: _height * 4,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: _width * 5),
                    alignment: Alignment.centerLeft,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Birthday",
                          style: GoogleFonts.mulish(
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                              color: lightgrey),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                            height: _height * 7,
                            width: _width * 90,
                            padding: EdgeInsets.all(10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Date of birth",
                                  style: GoogleFonts.mulish(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                      color: lightgrey),
                                ),
                                Icon(
                                  Icons.calendar_month_sharp,
                                  color: lightgrey,
                                )
                              ],
                            ),
                            decoration: BoxDecoration(
                              border: Border.all(color: lightgrey),
                              borderRadius: BorderRadius.circular(10),
                            )),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          "Please select which sex we should use to\ncalculate your calorie needs:",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.mulish(
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                              color: lightgrey),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            CustomRadioButton(
                              height: _height * 7,
                              width: _width * 42.5,
                              icon: Icons.woman,
                              text: "Female",
                              isSelected: false,
                              onTap: () {},
                            ),
                            SizedBox(
                              width: _width * 5,
                            ),
                            CustomRadioButton(
                              height: _height * 7,
                              width: _width * 42.5,
                              icon: Icons.man,
                              text: "Male",
                              isSelected: true,
                              onTap: () {},
                            )
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          "Height",
                          style: GoogleFonts.mulish(
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                              color: lightgrey),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          height: _height * 7,
                          // width: _width * 90,
                          child: Row(
                            children: [
                              Container(
                                height: _height * 7,
                                width: _width * 44.6,
                                child: Center(
                                  child: Text(
                                    "U.S.Standard",
                                    style: GoogleFonts.mulish(
                                        fontSize: 16,
                                        color: primary,
                                        fontWeight: FontWeight.w700),
                                  ),
                                ),
                                decoration: BoxDecoration(
                                  color: white,
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(color: lightgrey),
                                ),
                              ),
                              Container(
                                height: _height * 7,
                                width: _width * 44.6,
                                child: Center(
                                  child: Text(
                                    "Metric",
                                    style: GoogleFonts.mulish(
                                        fontSize: 16,
                                        color: lightgrey,
                                        fontWeight: FontWeight.w700),
                                  ),
                                ),
                                decoration: BoxDecoration(
                                  color: transperant,
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(color: transperant),
                                ),
                              )
                            ],
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: lightgrey),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: _width * 90,
                    child: Row(
                      children: [
                        Container(
                          width: _width * 42.5,
                          height: _height * 7,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: grey)),
                          child: Row(
                            children: [
                              Container(
                                height: _height * 7,
                                width: _width * 30,
                                child: TextFormField(
                                  cursorColor: white,
                                  textAlign: TextAlign.start,
                                  style: GoogleFonts.mulish(
                                      fontSize: 16,
                                      color: white,
                                      fontWeight: FontWeight.w700),
                                  onChanged: (value) {},
                                  decoration: InputDecoration(
                                    fillColor: Colors.transparent,
                                    contentPadding: EdgeInsets.all(13),
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: transperant),
                                      borderRadius: BorderRadius.circular(6),
                                    ),
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: transperant),
                                      borderRadius: BorderRadius.circular(6),
                                    ),
                                  ),
                                ),
                              ),
                              Icon(
                                Icons.expand_more,
                                color: lightgrey,
                                size: 30,
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          width: _width * 5,
                        ),
                        Container(
                          width: _width * 42.5,
                          height: _height * 7,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: grey)),
                          child: Row(
                            children: [
                              Container(
                                height: _height * 7,
                                width: _width * 30,
                                child: TextFormField(
                                  cursorColor: white,
                                  textAlign: TextAlign.start,
                                  style: GoogleFonts.mulish(
                                      fontSize: 16,
                                      color: white,
                                      fontWeight: FontWeight.w700),
                                  onChanged: (value) {},
                                  decoration: InputDecoration(
                                    fillColor: Colors.transparent,
                                    contentPadding: EdgeInsets.all(13),
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: transperant),
                                      borderRadius: BorderRadius.circular(6),
                                    ),
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: transperant),
                                      borderRadius: BorderRadius.circular(6),
                                    ),
                                  ),
                                ),
                              ),
                              Icon(
                                Icons.expand_more,
                                color: lightgrey,
                                size: 30,
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: _width * 90,
                    height: _height * 7,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: grey)),
                    child: Row(
                      children: [
                        Container(
                          height: _height * 7,
                          width: _width * 77,
                          child: TextFormField(
                            cursorColor: white,
                            textAlign: TextAlign.start,
                            style: GoogleFonts.mulish(
                                fontSize: 16,
                                color: white,
                                fontWeight: FontWeight.w700),
                            onChanged: (value) {},
                            decoration: InputDecoration(
                              fillColor: Colors.transparent,
                              contentPadding: EdgeInsets.all(13),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: transperant),
                                borderRadius: BorderRadius.circular(6),
                              ),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: transperant),
                                borderRadius: BorderRadius.circular(6),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          child: Text("cm",
                              style: GoogleFonts.mulish(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w700,
                                  color: white)),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: _height * 3,
                  ),
                  CustomButton(
                    width: _width * 90,
                    height: _height * 7,
                    lableText: "Next  ",
                    onPressed: () {},
                  ),
                  SizedBox(
                    height: 30,
                  )
                ],
              ),
            ),
          )),
    );
  }
}
