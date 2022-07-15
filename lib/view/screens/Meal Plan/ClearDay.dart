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
import 'package:levelup/util/images.dart';
import 'package:levelup/view/base/CustomButton.dart';

final SnackBar clearDaySnackBar = SnackBar(
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
            "Clear day(s) sucessfully",
            style: mulish16700,
          ),
          Icon(
            Icons.cancel,
            color: white,
          )
        ],
      ),
    ));

class ClearDay extends StatelessWidget {
  const ClearDay({Key? key}) : super(key: key);

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
            "Clear Day",
            style: textStyleAppBar,
          ),
        ),
        body: GetBuilder<CopyClearDayMealPlanController>(
            builder: (clearcontroller) {
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
                    "List of the day",
                    style: GoogleFonts.mulish(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        color: lightgrey),
                  ),
                  SizedBox(
                    height: _height * 3,
                  ),
                  ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: clearcontroller.clearDayWeekList.length,
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
                              Checkbox(
                                value: clearcontroller
                                    .clearDayWeekList[index].isSelected,
                                fillColor:
                                    MaterialStateProperty.all<Color>(white),
                                checkColor: primary,
                                onChanged: (value) {
                                  clearcontroller
                                      .updateSelecteddayofweekClearDay(
                                          value, index);
                                },
                                shape: RoundedRectangleBorder(
                                    side: BorderSide(color: white, width: 2),
                                    borderRadius: BorderRadius.circular(4)),
                              ),
                              RichText(
                                text: TextSpan(
                                  text:
                                      '${clearcontroller.clearDayWeekList[index].day} ',
                                  style: GoogleFonts.mulish(
                                      color: white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700),
                                  children: <TextSpan>[
                                    TextSpan(
                                      text:
                                          ' |  ${clearcontroller.clearDayWeekList[index].date}',
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
                      lableText: clearcontroller.totalClearDay != 0
                          ? "Clear (${clearcontroller.totalClearDay})"
                          : "Clear",
                      onPressed: () {
                        Get.back();
                        Get.back();
                        snackbarKey.currentState
                            ?.showSnackBar(clearDaySnackBar);
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
