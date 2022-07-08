// ignore_for_file: sort_child_properties_last, prefer_const_constructors

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:levelup/helper/routeHelper.dart';
import 'package:levelup/util/color.dart';
import 'package:levelup/util/decoration.dart';
import 'package:levelup/util/images.dart';
import 'package:levelup/view/base/BigCustomRadioButton.dart';
import 'package:levelup/view/base/CustomButton.dart';
import 'package:levelup/view/screens/Auth/CreateNewAccount/getStartedCreateAccount.dart';
import 'package:levelup/view/screens/Auth/CreateNewAccount/weighIn.dart';
import 'package:percent_indicator/percent_indicator.dart';

class Step05CreateAccount extends StatefulWidget {
  const Step05CreateAccount({Key? key}) : super(key: key);

  @override
  State<Step05CreateAccount> createState() => _Step05CreateAccountState();
}

class step05ItemModel {
  String item;
  bool isSelected;
  step05ItemModel({required this.item, required this.isSelected});
}

class _Step05CreateAccountState extends State<Step05CreateAccount> {
  int _selectedIndex = 0;
  List<step05ItemModel> step05itemList = [
    step05ItemModel(item: "Lose Body Fat", isSelected: true),
    step05ItemModel(item: "Maintain", isSelected: false),
    step05ItemModel(item: "Muscle Gain", isSelected: false)
  ];

  List dropDownItem = ["Gain 0.35 gram per week", " Lose 0.25 gram per week"];

  String selectedDropDownItem = "Gain 0.35 gram per week";

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width * 0.01;
    double _height = MediaQuery.of(context).size.height * 0.01;
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
        fit: BoxFit.cover,
        image: AssetImage(bgimage10),
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
                      "Step 5 of 5",
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
                    percent: 0.9,
                    backgroundColor: white,
                    progressColor: primary,
                  ),
                  SizedBox(
                    height: _height * 4,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: _width * 5),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "I want to",
                        style: GoogleFonts.mulish(
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                            color: lightgrey),
                      ),
                    ),
                  ),
                  Container(
                    height: _height * 10,
                    padding: EdgeInsets.only(
                      top: 20,
                    ),
                    child: Expanded(
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          physics: BouncingScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: step05itemList.length,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                setState(() {
                                  _selectedIndex = index;
                                });
                              },
                              child: Container(
                                margin: EdgeInsets.only(right: 20),
                                padding: EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 15),
                                decoration: BoxDecoration(
                                    color: _selectedIndex == index
                                        ? white
                                        : transperant,
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(color: white)),
                                child: Center(
                                  child: Text(
                                    step05itemList[index].item,
                                    style: GoogleFonts.mulish(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w700,
                                        color: _selectedIndex == index
                                            ? primary
                                            : white),
                                  ),
                                ),
                              ),
                            );
                          }),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: _height * 7,
                    width: _width * 90,
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton2(
                        isExpanded: true,
                        hint: Row(
                          children: [
                            Icon(
                              Icons.list,
                              size: 16,
                              color: Colors.yellow,
                            ),
                            SizedBox(
                              width: 4,
                            ),
                            Expanded(
                              child: Text(
                                'Select Item',
                                style: GoogleFonts.mulish(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700,
                                  color: white,
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                        items: dropDownItem
                            .map((item) => DropdownMenuItem<String>(
                                  value: item,
                                  child: Text(
                                    item,
                                    style: GoogleFonts.mulish(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700,
                                      color: white,
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ))
                            .toList(),
                        value: selectedDropDownItem,
                        onChanged: (value) {
                          setState(() {
                            selectedDropDownItem = value as String;
                          });
                        },
                        icon: const Icon(
                          Icons.expand_more,
                          size: 25,
                        ),
                        iconSize: 14,
                        iconEnabledColor: white,
                        iconDisabledColor: Colors.grey,
                        // buttonHeight: 50,
                        // buttonWidth: 160,
                        buttonPadding:
                            const EdgeInsets.only(left: 14, right: 14),
                        buttonDecoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: white,
                          ),
                          color: transperant,
                        ),
                        buttonElevation: 2,
                        itemHeight: 40,
                        itemPadding: const EdgeInsets.only(left: 14, right: 14),
                        dropdownMaxHeight: 200,
                        dropdownWidth: _width * 70,
                        dropdownPadding: null,
                        dropdownDecoration: BoxDecoration(
                          border: Border.all(color: grey),
                          borderRadius: BorderRadius.circular(10),
                          color: transperant,
                        ),
                        dropdownElevation: 8,
                        scrollbarRadius: const Radius.circular(40),
                        scrollbarThickness: 6,
                        scrollbarAlwaysShow: true,
                        offset: const Offset(10, 0),
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
                        lableText: "Finish",
                        onPressed: () {
                          Get.toNamed(RouteHelper.getGetStartedtoAppRoute());
                        }),
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
