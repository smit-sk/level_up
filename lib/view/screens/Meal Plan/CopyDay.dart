import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:levelup/controller/copy_clear_day_MP_controller.dart';
import 'package:levelup/controller/meal_plan_controller.dart';
import 'package:levelup/util/color.dart';
import 'package:levelup/util/decoration.dart';
import 'package:levelup/view/base/CustomButton.dart';
import 'package:levelup/view/base/CustomDropDown.dart';

import '../../../util/images.dart';

final SnackBar copyplanSnackbar = SnackBar(
    backgroundColor: transperant,
    content: Container(
      height: 50,
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

class CopyDayMealPlan extends StatelessWidget {
  CopyDayMealPlan({Key? key}) : super(key: key);
  String selectedDropdown =
      Get.find<CopyClearDayMealPlanController>().copyDayWeekList[0].daydate;

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
        body: GetBuilder<CopyClearDayMealPlanController>(
            builder: (copyController) {
          return SingleChildScrollView(
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
                      datalist: copyController.weekDayDateList,
                      selectedData: copyController.selctedDateCOPY,
                      dropdowncolor: black.withOpacity(0.5),
                      onChanged: (value) {
                        copyController.changeDateCOPY(value!);
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
                      itemCount: copyController.copyDayWeekList.length,
                      itemBuilder: ((context, index) {
                        bool isSelect = false;
                        return Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 5, vertical: 2),
                          margin: const EdgeInsets.only(
                            bottom: 20,
                          ),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: white)),
                          child: Row(
                            children: [
                              Transform.scale(
                                scale: 1.2,
                                child: Checkbox(
                                  value: copyController
                                      .copyDayWeekList[index].isSelected,
                                  fillColor:
                                      MaterialStateProperty.all<Color>(white),
                                  checkColor: primary,
                                  onChanged: (value) {
                                    copyController
                                        .updateSelecteddayofweekCopyDay(
                                            value, index);
                                  },
                                  shape: RoundedRectangleBorder(
                                      side: BorderSide(color: white, width: 2),
                                      borderRadius: BorderRadius.circular(4)),
                                ),
                              ),
                              RichText(
                                text: TextSpan(
                                  text:
                                      '${copyController.copyDayWeekList[index].day} ',
                                  style: GoogleFonts.mulish(
                                      color: white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700),
                                  children: <TextSpan>[
                                    TextSpan(
                                      text:
                                          ' |  ${copyController.copyDayWeekList[index].date}',
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
                      lableText: copyController.totalCopyDay != 0
                          ? "Paste (${copyController.totalCopyDay})"
                          : "Paste",
                      onPressed: () {
                        Get.back();
                        Get.back();
                        snackbarKey.currentState
                            ?.showSnackBar(copyplanSnackbar);
                        //copySnackbar(_height);
                      }),
                  SizedBox(
                    height: _height * 4,
                  ),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}
