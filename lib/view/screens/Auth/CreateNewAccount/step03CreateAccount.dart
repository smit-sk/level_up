import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
// ignore_for_file: prefer_const_constructors, sort_child_properties_last
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:levelup/util/color.dart';
import 'package:levelup/util/decoration.dart';
import 'package:levelup/util/images.dart';
import 'package:levelup/view/base/CustomButton.dart';
import 'package:levelup/view/base/CustomRadioButton.dart';
import 'package:levelup/view/base/CustomTextField.dart';
import 'package:levelup/view/base/ErrorTextField.dart';
import 'package:levelup/view/screens/Auth/CreateNewAccount/step04CreateAccount.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class Step03CreateAccount extends StatefulWidget {
  const Step03CreateAccount({Key? key}) : super(key: key);

  @override
  State<Step03CreateAccount> createState() => _Step03CreateAccountState();
}

class step03item {
  final String heading;
  final String text;
  final String icon;
  bool isSelected;
  step03item(
      {required this.heading,
      required this.text,
      required this.icon,
      required this.isSelected});
}

class _Step03CreateAccountState extends State<Step03CreateAccount> {
  List<step03item> step03itemDataList = [
    step03item(
        heading: "Lightly Active",
        text: "Little to no exercise.",
        icon: lightIcon,
        isSelected: true),
    step03item(
        heading: "Light",
        text:
            "1-2 hours per week, comfortable, easy breathing, low muscle load, light sweating",
        icon: veryLightIcon,
        isSelected: false),
    step03item(
        heading: "Moderate",
        text:
            "3-4 hours per week, Light muscular fatigue, easy breathing, moderate sweating",
        icon: moderateIcon,
        isSelected: false),
    step03item(
        heading: "Hard",
        text: "4-5 hours per week, Muscular fatigue and heavy breathing",
        icon: hardIcon,
        isSelected: false),
    step03item(
        heading: "Very Hard",
        text: "6+ hours per week, Very exhausting for breathing and muscles.",
        icon: veryhardIcon,
        isSelected: false),
  ];

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width * 0.01;
    double _height = MediaQuery.of(context).size.height * 0.01;
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
        fit: BoxFit.cover,
        image: AssetImage(bgimage7),
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
                      "Step 3 of 5",
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
                    percent: 0.6,
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
                              "What is your excerise activity level?",
                              style: GoogleFonts.mulish(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700,
                                  color: lightgrey),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            ListView.builder(
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                                itemCount: 5,
                                itemBuilder: (context, index) {
                                  return GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        step03itemDataList[index].isSelected =
                                            !step03itemDataList[index]
                                                .isSelected;
                                      });
                                    },
                                    child: Container(
                                      padding:
                                          EdgeInsets.fromLTRB(20, 20, 20, 20),
                                      margin: EdgeInsets.all(10),
                                      child: Row(
                                        children: [
                                          Container(
                                            width: _width * 10,
                                            child: SvgPicture.asset(
                                              step03itemDataList[index].icon,
                                              color: step03itemDataList[index]
                                                      .isSelected
                                                  ? primary
                                                  : white,
                                            ),
                                          ),
                                          SizedBox(
                                            width: _width * 5,
                                          ),
                                          Flexible(
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  step03itemDataList[index]
                                                      .heading,
                                                  style: GoogleFonts.mulish(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      color: step03itemDataList[
                                                                  index]
                                                              .isSelected
                                                          ? primary
                                                          : white),
                                                ),
                                                SizedBox(
                                                  height: 10,
                                                ),
                                                Text(
                                                  step03itemDataList[0].text,
                                                  style: GoogleFonts.mulish(
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      color: step03itemDataList[
                                                                  index]
                                                              .isSelected
                                                          ? primary
                                                          : lightgrey),
                                                ),
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                      decoration: BoxDecoration(
                                          color: step03itemDataList[index]
                                                  .isSelected
                                              ? white
                                              : transperant,
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          border: Border.all(color: lightgrey)),
                                    ),
                                  );
                                }),
                            SizedBox(
                              height: 10,
                            ),
                            Center(
                              child: CustomButton(
                                  width: _width * 85,
                                  height: _height * 7,
                                  lableText: "Next",
                                  onPressed: () {
                                    Get.to(() => Step04CreateAccount());
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
