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
import 'package:levelup/view/base/CustomTextFieldSuffix.dart';
import 'package:levelup/view/screens/Auth/CreateNewAccount/BodyFat.dart';
import 'package:percent_indicator/percent_indicator.dart';

class WeighIn extends StatefulWidget {
  const WeighIn({Key? key}) : super(key: key);

  @override
  State<WeighIn> createState() => _WeighInState();
}

class _WeighInState extends State<WeighIn> {
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
          appBar: AppBar(
            leading: Icon(
              Icons.arrow_back,
              color: white,
            ),
            title: Text(
              "Weigh In",
              style: GoogleFonts.mulish(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.w900),
            ),
            centerTitle: true,
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
          backgroundColor: Colors.transparent,
          body: Container(
            width: _width * 100,
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                children: [
                  BigCustomRadioBUtton(
                      height: _height * 7,
                      width: _width * 89,
                      isSelectedUSstandard: true,
                      isSelectedMatric: false,
                      onTap: () {}),
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
                  CustormTextFieldSuffix(
                      height: _height * 7,
                      widthContainer: _width * 90,
                      widthTextField: _width * 70,
                      onChanged: (value) {
                        return "";
                      },
                      suffixText: "kg"),
                  SizedBox(
                    height: 20,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Neck",
                      style: GoogleFonts.mulish(
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                          color: lightgrey),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  CustormTextFieldSuffix(
                      height: _height * 7,
                      widthContainer: _width * 90,
                      widthTextField: _width * 70,
                      onChanged: (value) {
                        return "";
                      },
                      suffixText: "cm"),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      CustormTextFieldSuffix(
                          height: _height * 7,
                          widthContainer: _width * 42,
                          widthTextField: _width * 20,
                          onChanged: (value) {
                            return "";
                          },
                          suffixText: "ft"),
                      SizedBox(
                        width: _width * 5,
                      ),
                      CustormTextFieldSuffix(
                          height: _height * 7,
                          widthContainer: _width * 42,
                          widthTextField: _width * 20,
                          onChanged: (value) {
                            return "";
                          },
                          suffixText: "in"),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Waist",
                      style: GoogleFonts.mulish(
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                          color: lightgrey),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  CustormTextFieldSuffix(
                      height: _height * 7,
                      widthContainer: _width * 90,
                      widthTextField: _width * 70,
                      onChanged: (value) {
                        return "";
                      },
                      suffixText: "cm"),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      CustormTextFieldSuffix(
                          height: _height * 7,
                          widthContainer: _width * 42,
                          widthTextField: _width * 20,
                          onChanged: (value) {
                            return "";
                          },
                          suffixText: "ft"),
                      SizedBox(
                        width: _width * 5,
                      ),
                      CustormTextFieldSuffix(
                          height: _height * 7,
                          widthContainer: _width * 42,
                          widthTextField: _width * 20,
                          onChanged: (value) {
                            return "";
                          },
                          suffixText: "in"),
                    ],
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  CustomButton(
                      width: _width * 90,
                      height: _height * 7,
                      lableText: "Calculate",
                      onPressed: () {
                        Get.to(BodyFat());
                      }),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Clear",
                    style: GoogleFonts.mulish(
                      fontSize: 16,
                      color: white,
                      fontWeight: FontWeight.w700,
                    ),
                  )
                ],
              ),
            ),
          )),
    );
  }
}
