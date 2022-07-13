import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:levelup/controller/meal_plan_controller.dart';
import 'package:levelup/util/color.dart';
import 'package:levelup/util/decoration.dart';
import 'package:levelup/view/base/CustomButton.dart';
import 'package:levelup/view/base/CustomDropDown.dart';

import '../../../util/images.dart';

class COpyDayMealPlan extends StatefulWidget {
  const COpyDayMealPlan({Key? key}) : super(key: key);

  @override
  State<COpyDayMealPlan> createState() => _COpyDayMealPlanState();
}

class _COpyDayMealPlanState extends State<COpyDayMealPlan> {
  String selectedDropdown = Get.find<MealPlanController>().weekDayDateList[0];

  GlobalKey<ScaffoldState> _copydayScffoldkey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width * 0.01;
    double _height = MediaQuery.of(context).size.height * 0.01;
    return Container(
      decoration: BoxDecoration(
          color: transperant,
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage(bgimage10),
          )),
      child: Scaffold(
        key: _copydayScffoldkey,
        backgroundColor: transperant,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: transperant,
          centerTitle: true,
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            color: white,
            onPressed: () {
              Get.back();
            },
          ),
          title: Text(
            "Copy Day",
            style: textStyleAppBar,
          ),
        ),
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Container(
            margin:
                EdgeInsets.symmetric(vertical: 10, horizontal: _width * 2.5),
            padding: EdgeInsets.symmetric(horizontal: _width * 5),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Copy day meal plan list",
                  style: GoogleFonts.mulish(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      color: lightgrey),
                ),
                SizedBox(
                  height: _height * 2.5,
                ),
                CustomDropDownMenu(
                    height: _height * 7,
                    width: _width * 90,
                    dropdownWidth: _width * 80,
                    datalist: Get.find<MealPlanController>().weekDayDateList,
                    selectedData: selectedDropdown,
                    dropdowncolor: primary.withOpacity(0.5),
                    onChanged: (value) {
                      setState(() {
                        selectedDropdown = value!;
                      });
                    }),
                SizedBox(
                  height: _height * 5,
                ),
                Text(
                  "Paste day meal plan list",
                  style: GoogleFonts.mulish(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      color: lightgrey),
                ),
                SizedBox(
                  height: _height * 2.5,
                ),
                ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount:
                        Get.find<MealPlanController>().weekDayList.length,
                    itemBuilder: ((context, index) {
                      bool isSelect = false;
                      return Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 5, vertical: 2),
                        margin: EdgeInsets.only(
                          bottom: 20,
                        ),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: white)),
                        child: Row(
                          children: [
                            GetBuilder<MealPlanController>(
                                builder: (mealplancontroller) {
                              return Checkbox(
                                value: Get.find<MealPlanController>()
                                    .selectedDayList[index],
                                fillColor:
                                    MaterialStateProperty.all<Color>(white),
                                checkColor: primary,
                                onChanged: (value) {
                                  Get.find<MealPlanController>()
                                      .updateSelecteddayofweek(value, index);
                                },
                                shape: RoundedRectangleBorder(
                                    side: BorderSide(color: white, width: 2),
                                    borderRadius: BorderRadius.circular(4)),
                              );
                            }),
                            RichText(
                              text: TextSpan(
                                text:
                                    '${Get.find<MealPlanController>().weekDayList[index]} ',
                                style: GoogleFonts.mulish(
                                    color: white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700),
                                children: <TextSpan>[
                                  TextSpan(
                                    text:
                                        ' |  ${Get.find<MealPlanController>().weekDateList[index]}',
                                    style: GoogleFonts.mulish(
                                        color: white,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    })),
                SizedBox(
                  height: _height * 2,
                ),
                CustomButton(
                    width: _width * 90,
                    height: _height * 7,
                    lableText: "Past(3)",
                    onPressed: () {
                      Get.back();

                      _copydayScffoldkey.currentState!
                          .showSnackBar(copySnackbar(_height));
                      //copySnackbar(_height);
                    }),
                SizedBox(
                  height: _height * 4,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  copySnackbar(_height) {
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
                "Meal plan copied sucessfully",
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
