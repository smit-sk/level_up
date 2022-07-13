// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:levelup/helper/routeHelper.dart';
import 'package:levelup/util/color.dart';
import 'package:levelup/util/images.dart';
import 'package:levelup/view/base/BigCustomRadioButton.dart';
import 'package:levelup/view/base/CustomButton.dart';
import 'package:levelup/view/base/CustomTextFieldSuffix.dart';

class BodyFat extends StatefulWidget {
  const BodyFat({Key? key}) : super(key: key);

  @override
  State<BodyFat> createState() => _BodyFatState();
}

class _BodyFatState extends State<BodyFat> {
  bool isUSstandard = false;
  bool isMetric = true;

  String _weight = "";
  String _metricBodyfat = "";
  String bodyFatUSft = "";
  String bodyFatUSin = "";

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
              "Body Fat",
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
                      width: _width * 88,
                      isSelectedLeftText: isUSstandard,
                      isSelectedRightText: isMetric,
                      LeftText: "U.S. Standard",
                      RightText: "Metric",
                      onTap: () {
                        setState(() {
                          isUSstandard = !isUSstandard;
                          isMetric = !isMetric;
                        });
                      }),
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
                      widthContainer: _width * 88,
                      widthTextField: _width * 68,
                      onChanged: (value) {
                        setState(() {
                          this._weight = value;
                        });
                      },
                      suffixText: "kg"),
                  SizedBox(
                    height: 20,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Body Fat",
                      style: GoogleFonts.mulish(
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                          color: lightgrey),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  isMetric
                      ? CustormTextFieldSuffix(
                          height: _height * 7,
                          widthContainer: _width * 88,
                          widthTextField: _width * 68,
                          onChanged: (value) {
                            setState(() {
                              this._metricBodyfat = value;
                            });
                          },
                          suffixText: "%")
                      : Row(
                          children: [
                            CustormTextFieldSuffix(
                                height: _height * 7,
                                widthContainer: _width * 41,
                                widthTextField: _width * 20,
                                onChanged: (value) {
                                  setState(() {
                                    this.bodyFatUSft = value;
                                  });
                                },
                                suffixText: "ft"),
                            SizedBox(
                              width: _width * 5,
                            ),
                            CustormTextFieldSuffix(
                                height: _height * 7,
                                widthContainer: _width * 41,
                                widthTextField: _width * 20,
                                onChanged: (value) {
                                  setState(() {
                                    this.bodyFatUSft = value;
                                  });
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
                      lableText: "Continue",
                      onPressed: () {
                        Get.toNamed(RouteHelper.getResultCreateAccountRoute());
                      }),
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
