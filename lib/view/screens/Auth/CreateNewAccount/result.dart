// ignore_for_file: sort_child_properties_last, prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:levelup/helper/routeHelper.dart';
import 'package:levelup/util/color.dart';
import 'package:levelup/util/images.dart';
import 'package:levelup/view/base/CustomButton.dart';
import 'package:levelup/view/base/CustomContainerTwoText.dart';

class ResultCA extends StatefulWidget {
  const ResultCA({Key? key}) : super(key: key);

  @override
  State<ResultCA> createState() => _ResultCAState();
}

class _ResultCAState extends State<ResultCA> {
  bool isMale = true;

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width * 0.01;
    double _height = MediaQuery.of(context).size.height * 0.01;
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
        fit: BoxFit.cover,
        image: AssetImage(isMale ? bgimage9 : bgimage10),
      )),
      child: Scaffold(
        backgroundColor: transperant,
        appBar: AppBar(
          backgroundColor: transperant,
          leading: GestureDetector(
            onTap: (() {
              Get.back();
            }),
            child: Icon(
              Icons.arrow_back,
              color: white,
            ),
          ),
          title: Text(
            "Result",
            style: GoogleFonts.mulish(
                color: Colors.white, fontSize: 24, fontWeight: FontWeight.w900),
          ),
          centerTitle: true,
          elevation: 0,
        ),
        body: Container(
          padding: EdgeInsets.symmetric(
              horizontal: _width * 5, vertical: _height * 2),
          child: Column(
            children: [
              Container(
                width: _width * 90,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        // For managing body fat level
                        SizedBox(
                          width: _width * 62,
                        ),
                        Container(
                          height: _height * 7,
                          width: _width * 16,
                          alignment: Alignment.topCenter,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                            image: AssetImage(
                              alertImage,
                            ),
                          )),
                          child: Column(
                            children: [
                              SizedBox(
                                height: _height * 1.0,
                              ),
                              Text(
                                "BODY FAT",
                                style: GoogleFonts.mulish(
                                  fontSize: 8,
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                              Text("15.5%",
                                  style: GoogleFonts.mulish(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w800,
                                  ))
                            ],
                          ),
                        ),
                      ],
                    ),
                    Image.asset(
                      isMale ? colorBarManFUll : colorBarWoManFUll,
                    )
                  ],
                ),
              ),
              SizedBox(
                height: _height * 5,
              ),
              CustomContainerTwotext(
                  leftText: "Body For Category", rightText: "Fitness"),
              SizedBox(
                height: _height * 3,
              ),
              CustomContainerTwotext(
                  leftText: "Body For Mass", rightText: "23.2 lbs"),
              SizedBox(
                height: _height * 3,
              ),
              CustomContainerTwotext(
                  leftText: "Lean Body Mass", rightText: "128.8 lbs"),
              SizedBox(
                height: _height * 3,
              ),
              CustomContainerTwotext(
                  leftText: "Ideal body fat for Given Age\n(Jackson & Pollard)",
                  rightText: "10.5%"),
              SizedBox(
                height: _height * 3,
              ),
              CustomContainerTwotext(
                  leftText: "Body Fat to Lose to\nReach Ideal",
                  rightText: "7.2 lbs"),
              SizedBox(
                height: _height * 3,
              ),
              CustomButton(
                  width: _width * 90,
                  height: _height * 7,
                  lableText: "Add Weigh In",
                  onPressed: () {
                    Get.toNamed(RouteHelper.getStep05CreateAccountRoute());
                  })
            ],
          ),
        ),
      ),
    );
  }
}
