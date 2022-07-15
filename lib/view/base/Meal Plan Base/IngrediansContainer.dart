// ignore_for_file: sort_child_properties_last, prefer_const_constructors, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:levelup/controller/meal_plan_controller.dart';
import 'package:levelup/util/color.dart';
import 'package:levelup/util/decoration.dart';
import 'package:levelup/util/images.dart';
import 'package:levelup/view/base/CustomButton.dart';

class IngrediansContainer extends StatelessWidget {
  bool isSelected;
  bool isDragable;
  IngrediansContainer({
    Key? key,
    this.isSelected = false,
    this.isDragable = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width * 0.01;
    double _height = MediaQuery.of(context).size.height * 0.01;

    return GetBuilder<MealPlanController>(builder: (mealplancontroller) {
      return Slidable(
        child: GestureDetector(
          onTap: () {},
          child: Container(
            width: _width * 90,
            margin: EdgeInsets.only(bottom: _height * 2.5, right: 0),
            padding: EdgeInsets.fromLTRB(
                _width * 7, _height * 2.5, _width * 5, _height * 2.5),
            decoration: BoxDecoration(
              color: isSelected ? white : transperant,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: white),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Container(
                      height: _height * 7,
                      width: _width * 14,
                      decoration: BoxDecoration(
                        color: white,
                        image: DecorationImage(
                          image: ExactAssetImage(logo),
                          fit: BoxFit.cover,
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(50.0)),
                        border: Border.all(
                          color: pgreen,
                          width: 5.0,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: _width * 5,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        RichText(
                          text: TextSpan(
                            text: 'Almond Milk\n',
                            style: GoogleFonts.mulish(
                                color: isSelected ? black : white,
                                fontSize: 16,
                                fontWeight: FontWeight.w800),
                            children: <TextSpan>[
                              TextSpan(
                                text: 'unsweetened, plain, shelf stable',
                                style: GoogleFonts.mulish(
                                    color: isSelected ? black : white,
                                    fontSize: 13,
                                    fontWeight: FontWeight.w600),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: _height * 2.5,
                        ),
                        RichText(
                          text: TextSpan(
                            text: '1 Cup/',
                            style: GoogleFonts.mulish(
                                color: isSelected ? black : white,
                                fontSize: 16,
                                fontWeight: FontWeight.w800),
                            children: <TextSpan>[
                              TextSpan(
                                text: '240g',
                                style: GoogleFonts.mulish(
                                    color: isSelected ? black : white,
                                    fontSize: 13,
                                    fontWeight: FontWeight.w600),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                isDragable
                    ? SizedBox(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Divider(
                              color: isSelected ? black : grey,
                              height: 10,
                            ),
                            SizedBox(
                              height: _height * 1.5,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Portion Lock",
                                  style: GoogleFonts.mulish(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    color: isSelected ? black : white,
                                  ),
                                ),
                                FlutterSwitch(
                                  width: 55,
                                  borderRadius: 25,
                                  value: Get.find<MealPlanController>().toggle,
                                  activeColor: primary,
                                  inactiveColor: grey.withOpacity(0.5),
                                  onToggle: (value) {
                                    Get.find<MealPlanController>()
                                        .updatetoggle(value);
                                  },
                                ),
                              ],
                            ),
                          ],
                        ),
                      )
                    : SizedBox()
              ],
            ),
          ),
        ),
        endActionPane:
            ActionPane(extentRatio: 0.40, motion: ScrollMotion(), children: [
          SizedBox(
            width: _width * 8,
          ),
          GestureDetector(
            onTap: () {
              deleteBottomSheet(_height, _width, context);
            },
            child: Container(
              height: _height * 12,
              width: _width * 23,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.delete,
                      color: Colors.red,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Delete",
                      style: GoogleFonts.mulish(
                          color: Colors.red,
                          fontSize: 14,
                          fontWeight: FontWeight.w600),
                    )
                  ]),
              decoration: BoxDecoration(
                color: white,
                border: Border.all(color: white),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        ]),
      );
    });
  }

  void deleteBottomSheet(_height, _width, context) {
    Get.bottomSheet(
      Container(
        height: _height * 35,
        decoration: BoxDecoration(
            color: darkprimary,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20.0),
                topRight: Radius.circular(20.0))),
        padding:
            EdgeInsets.symmetric(horizontal: _width * 7, vertical: _height * 4),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Delete Almond Milk ",
              style: mulish22800,
            ),
            Text(
              "Are you sure you want to delete this Almond milk?",
              textAlign: TextAlign.center,
              style: mulish16600,
            ),
            CustomButton(
                width: _width * 90,
                height: _height * 7,
                lableText: "Delete",
                onPressed: () {
                  Get.back();
                  Scaffold.of(context)
                      .showSnackBar(deleteSnackbar(_height, _width));
                })
          ],
        ),
      ),
    );
  }

  deleteSnackbar(_height, _width) {
    return SnackBar(
        backgroundColor: transperant,
        content: Container(
          height: _height * 7,
          padding: EdgeInsets.symmetric(horizontal: 20),
          decoration: BoxDecoration(
              color: primary, borderRadius: BorderRadius.circular(10)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Mesaage Deleted ",
                style: mulish16700,
              ),
              Icon(
                Icons.cancel,
                color: white,
              )
            ],
          ),
        ));
  }
}
