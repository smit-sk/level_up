// ignore_for_file: sort_child_properties_last, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:levelup/util/color.dart';
import 'package:levelup/util/decoration.dart';
import 'package:levelup/util/images.dart';
import 'package:levelup/view/base/BigCustomRadioButton.dart';
import 'package:levelup/view/base/CustomButton.dart';
import 'package:levelup/view/screens/Auth/CreateNewAccount/weighIn.dart';
import 'package:percent_indicator/percent_indicator.dart';
class Step05CreateAccount extends StatefulWidget {
  const Step05CreateAccount({Key? key}) : super(key: key);

  @override
  State<Step05CreateAccount> createState() => _Step05CreateAccountState();
}

class _Step05CreateAccountState extends State<Step05CreateAccount> {
   @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width * 0.01;
    double _height = MediaQuery.of(context).size.height * 0.01;
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
        fit: BoxFit.cover,
        image: AssetImage(bgimage8),
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
                      "Step 4 of 5",
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
                    percent: 0.8,
                    backgroundColor: white,
                    progressColor: primary,
                  ),
                  SizedBox(
                    height: _height * 4,
                  ),
                  Container(
                      padding: EdgeInsets.symmetric(horizontal: _width * 7.5),
                      alignment: Alignment.centerLeft,
                      child: Column(children: [
                        Text(
                          "Let's create your first weigh-in. First, enter your weight.",
                          style: GoogleFonts.mulish(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: white),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Weight",
                            style: GoogleFonts.mulish(
                                fontSize: 14,
                                fontWeight: FontWeight.w700,
                                color: lightgrey),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        BigCustomRadioBUtton(
                            height: _height * 7,
                            width: _width * 85,
                            isSelectedUSstandard: true,
                            isSelectedMatric: false,
                            onTap: () {}),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          width: _width * 85,
                          height: _height * 7,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: grey)),
                          child: Row(
                            children: [
                              Container(
                                padding:
                                    EdgeInsets.symmetric(vertical: _height * 2),
                                width: _width * 65,
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
                              Container(
                                child: Text("lbs/kg",
                                    style: GoogleFonts.mulish(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w700,
                                        color: white)),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          "Now we need an estimate of your body fat percentage. Swipe through the pictures below to find the one that most closely matches your body type.",
                          style: GoogleFonts.mulish(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: white),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(vertical: 30),
                          child: Center(
                            child: SvgPicture.asset(
                              fatBoyIcon,
                              color: lightgrey,
                            ),
                          ),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all(color: lightgrey)),
                        ),
                        SizedBox(
                          height: _height * 6,
                        ),
                        Text(
                          "Have a tape measure?",
                          style: GoogleFonts.mulish(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: white),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(vertical: _height * 2),
                          child: Center(
                            child: Text("Get a more accurate estimate",
                                style: textStyleButton),
                          ),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: lightgrey)),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          width: _width * 85,
                          child: Row(
                            children: [
                              Container(
                                width: _width * 38,
                                child: Divider(
                                  thickness: 1,
                                  color: Color(0xFFE5E5E5),
                                ),
                              ),
                              Container(
                                width: _width * 9,
                                child: Center(
                                  child: Text("OR",
                                      style: GoogleFonts.mulish(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                          color: Color(0xFFE5E5E5))),
                                ),
                              ),
                              Container(
                                width: _width * 38,
                                child: Divider(
                                  thickness: 1,
                                  color: lightgrey,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(vertical: _height * 2),
                          child: Center(
                            child: Text(
                                "Enter your body fat percentage manually",
                                textAlign: TextAlign.center,
                                style: textStyleButton),
                          ),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: lightgrey)),
                        ),
                        SizedBox(
                          height: _height * 5,
                        ),
                        Center(
                          child: CustomButton(
                              width: _width * 85,
                              height: _height * 7,
                              lableText: "Next",
                              onPressed: () {
                                Get.to(() => WeighIn());
                              }),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                      ])),
                ],
              ),
            ),
          )),
    );
  }
}
