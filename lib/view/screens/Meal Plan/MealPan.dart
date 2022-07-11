// ignore_for_file: sort_child_properties_last
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:levelup/util/color.dart';
import 'package:levelup/util/decoration.dart';
import 'package:levelup/util/images.dart';
import 'package:levelup/view/base/CustomButton.dart';
import 'package:levelup/view/base/CustomToast.dart';
import 'package:levelup/view/base/ExpansionContainer.dart';
import 'package:levelup/view/base/IngrediansContainer.dart';

import 'package:syncfusion_flutter_charts/charts.dart';

class MealPlan extends StatefulWidget {
  const MealPlan({Key? key}) : super(key: key);
  @override
  State<MealPlan> createState() => _MealPlanState();
}

class ChartData {
  ChartData(this.x, this.y, [this.color]);
  final String x;
  final double y;
  final Color? color;
}

class _MealPlanState extends State<MealPlan> {
  final List<ChartData> chartData = [
    ChartData('David', 35, Color(0xFF8912FB)),
    ChartData('Steve', 60, Color(0xFFFEB13D)),
    ChartData('Jack', 5, Color(0xFF2BB9B0)),
  ];
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
              "Meal Plan",
              style: textStyleAppBar,
            ),
            actions: [
              IconButton(
                  onPressed: () {
                    show(context, "hello hunny bunny ");
                  },
                  icon: Icon(
                    Icons.more_vert,
                    size: 25,
                    color: white,
                  ))
            ],
          ),
          body: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: _width * 5),
              alignment: Alignment.center,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Daily Totals",
                    style: GoogleFonts.mulish(
                        fontSize: 22,
                        color: white,
                        fontWeight: FontWeight.w700),
                  ),
                  SizedBox(
                    height: _height * 2.5,
                  ),
                  Container(
                    height: _height * 18,
                    width: _width * 90,
                    decoration: BoxDecoration(
                      border: Border.all(color: white),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: _width * 35,
                          child: SfCircularChart(
                              annotations: <CircularChartAnnotation>[
                                CircularChartAnnotation(
                                    widget: Container(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "3564",
                                        style: GoogleFonts.mulish(
                                          color: white,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w800,
                                        ),
                                      ),
                                      Text(
                                        "Cal",
                                        style: GoogleFonts.mulish(
                                          color: white,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ],
                                  ),
                                ))
                              ],
                              series: <CircularSeries>[
                                DoughnutSeries<ChartData, String>(
                                    dataSource: chartData,
                                    pointColorMapper: (ChartData data, _) =>
                                        data.color,
                                    xValueMapper: (ChartData data, _) => data.x,
                                    yValueMapper: (ChartData data, _) => data.y,
                                    cornerStyle: CornerStyle.bothCurve,
                                    innerRadius: '80%',
                                    radius: '85%'),
                              ]),
                        ),
                        Container(
                          padding: EdgeInsets.only(top: _height * 3),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                "35 %",
                                style: GoogleFonts.mulish(
                                    color: primary,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w700),
                              ),
                              SizedBox(
                                height: _height * 2,
                              ),
                              Text(
                                "135 g",
                                style: GoogleFonts.mulish(
                                    color: white,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w800),
                              ),
                              SizedBox(
                                height: _height * 2,
                              ),
                              Text(
                                "Protein",
                                style: GoogleFonts.mulish(
                                    color: white,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(top: _height * 3),
                          child: Column(
                            children: [
                              Text(
                                "5%",
                                style: GoogleFonts.mulish(
                                    color: pgreen,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w700),
                              ),
                              SizedBox(
                                height: _height * 2,
                              ),
                              Text(
                                "135 g",
                                style: GoogleFonts.mulish(
                                    color: white,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w800),
                              ),
                              SizedBox(
                                height: _height * 2,
                              ),
                              Text(
                                "Carbs",
                                style: GoogleFonts.mulish(
                                    color: white,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(top: _height * 3),
                          child: Column(
                            children: [
                              Text(
                                "60%",
                                style: GoogleFonts.mulish(
                                    color: pyellow,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w700),
                              ),
                              SizedBox(
                                height: _height * 2,
                              ),
                              Text(
                                "135 g",
                                style: GoogleFonts.mulish(
                                    color: white,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w800),
                              ),
                              SizedBox(
                                height: _height * 2,
                              ),
                              Text(
                                "Fat",
                                style: GoogleFonts.mulish(
                                    color: white,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: _height * 2.5,
                  ),
                  Row(
                    children: [
                      Text(
                        "BreakFast",
                        style: GoogleFonts.mulish(
                            fontSize: 22,
                            color: white,
                            fontWeight: FontWeight.w700),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Container(
                        height: _height * 2.5,
                        width: _width * 5,
                        decoration: BoxDecoration(
                          border: Border.all(color: white, width: 2),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Icon(
                          Icons.question_mark_outlined,
                          color: white,
                          size: 14,
                        ),
                      ),
                      Flexible(
                        child: SizedBox(),
                        fit: FlexFit.tight,
                      ),
                      Text(
                        "1595 ",
                        style: GoogleFonts.mulish(
                            fontSize: 16,
                            color: white,
                            fontWeight: FontWeight.w800),
                      ),
                      Text(
                        "Cal",
                        style: GoogleFonts.mulish(
                            fontSize: 16,
                            color: white,
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: _height * 2.5,
                  ),
                  IngrediansContainer(),
                  SizedBox(
                    height: _height * 2.5,
                  ),
                  ExpansionContainer(),
                  SizedBox(
                    height: _height * 2.5,
                  ),
                  Row(
                    children: [
                      Text(
                        "Lunch",
                        style: GoogleFonts.mulish(
                            fontSize: 22,
                            color: white,
                            fontWeight: FontWeight.w700),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Container(
                        height: _height * 2.5,
                        width: _width * 5,
                        decoration: BoxDecoration(
                          border: Border.all(color: white, width: 2),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Icon(
                          Icons.question_mark_outlined,
                          color: white,
                          size: 14,
                        ),
                      ),
                      Flexible(
                        child: SizedBox(),
                        fit: FlexFit.tight,
                      ),
                      Text(
                        "1595 ",
                        style: GoogleFonts.mulish(
                            fontSize: 16,
                            color: white,
                            fontWeight: FontWeight.w800),
                      ),
                      Text(
                        "Cal",
                        style: GoogleFonts.mulish(
                            fontSize: 16,
                            color: white,
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: _height * 2.5,
                  ),
                  ExpansionContainer(),
                  SizedBox(
                    height: _height * 2.5,
                  ),
                  Row(
                    children: [
                      Text(
                        "Dinner",
                        style: GoogleFonts.mulish(
                            fontSize: 22,
                            color: white,
                            fontWeight: FontWeight.w700),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Container(
                        height: _height * 2.5,
                        width: _width * 5,
                        decoration: BoxDecoration(
                          border: Border.all(color: white, width: 2),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Icon(
                          Icons.question_mark_outlined,
                          color: white,
                          size: 14,
                        ),
                      ),
                      Flexible(
                        child: SizedBox(),
                        fit: FlexFit.tight,
                      ),
                      Text(
                        "1595 ",
                        style: GoogleFonts.mulish(
                            fontSize: 16,
                            color: white,
                            fontWeight: FontWeight.w800),
                      ),
                      Text(
                        "Cal",
                        style: GoogleFonts.mulish(
                            fontSize: 16,
                            color: white,
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: _height * 2.5,
                  ),
                  IngrediansContainer(),
                  SizedBox(
                    height: _height * 2.5,
                  ),
                  ExpansionContainer(),
                  SizedBox(
                    height: _height * 2.5,
                  ),
                  SizedBox(
                    height: _height * 2.5,
                  ),
                  CustomButton(
                      width: _width * 90,
                      height: _height * 7,
                      lableText: "Add New Foods/Recipe",
                      onPressed: () {}),
                  SizedBox(
                    height: _height * 2.5,
                  ),
                  Text(
                    "Actual & Target",
                    style: GoogleFonts.mulish(
                        fontSize: 22,
                        color: white,
                        fontWeight: FontWeight.w700),
                  ),
                  SizedBox(
                    height: _height * 2.5,
                  ),
                  Container(
                      width: _width * 90,
                      padding: EdgeInsets.fromLTRB(
                          _width * 2.5, _height * 3, _width * 2.5, _height * 3),
                      decoration: BoxDecoration(
                          color: transperant,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: white)),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                width: _width * 20,
                              ),
                              Container(
                                width: _width * 16,
                                child: Text(
                                  "Cal",
                                  style: mulish14500,
                                ),
                              ),
                              Container(
                                width: _width * 16,
                                child: Text(
                                  "Protein",
                                  style: mulish14500,
                                ),
                              ),
                              Container(
                                width: _width * 16,
                                child: Text(
                                  "Carbs",
                                  style: mulish14500,
                                ),
                              ),
                              Container(
                                width: _width * 16,
                                child: Text(
                                  "Fat",
                                  style: mulish14500,
                                ),
                              )
                            ],
                          ),
                          Divider(
                            height: 35,
                            color: grey,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                width: _width * 20,
                                child: Text(
                                  "Actual",
                                  style: mulish14800,
                                ),
                              ),
                              Container(
                                width: _width * 16,
                                child: Text(
                                  "1810",
                                  style: mulish14600,
                                ),
                              ),
                              Container(
                                width: _width * 16,
                                child: Text(
                                  "24%",
                                  style: GoogleFonts.mulish(
                                    color: primary,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                              Container(
                                width: _width * 16,
                                child: Text(
                                  "62%",
                                  style: GoogleFonts.mulish(
                                    color: pgreen,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                              Container(
                                width: _width * 16,
                                child: Text(
                                  "14%",
                                  style: GoogleFonts.mulish(
                                    color: pyellow,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                width: _width * 20,
                                child: Text(
                                  "Target",
                                  style: mulish14800,
                                ),
                              ),
                              Container(
                                width: _width * 16,
                                child: Text(
                                  "1798",
                                  style: mulish14600,
                                ),
                              ),
                              Container(
                                width: _width * 16,
                                child: Text(
                                  "25",
                                  style: GoogleFonts.mulish(
                                    color: primary,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                              Container(
                                width: _width * 16,
                                child: Text(
                                  "60%",
                                  style: GoogleFonts.mulish(
                                    color: pgreen,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                              Container(
                                width: _width * 16,
                                child: Text(
                                  "14%",
                                  style: GoogleFonts.mulish(
                                    color: pyellow,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              )
                            ],
                          ),
                          Divider(
                            height: 35,
                            color: grey,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                width: _width * 20,
                                alignment: Alignment.center,
                                child: Text(
                                  "+/-",
                                  style: mulish14800,
                                ),
                              ),
                              Container(
                                width: _width * 16,
                                child: Text(
                                  "12",
                                  style: mulish14600,
                                ),
                              ),
                              Container(
                                width: _width * 16,
                                child: Text(
                                  "-1%",
                                  style: GoogleFonts.mulish(
                                    color: primary,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                              Container(
                                width: _width * 16,
                                child: Text(
                                  "2%",
                                  style: GoogleFonts.mulish(
                                    color: pgreen,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                              Container(
                                width: _width * 16,
                                child: Text(
                                  "0%",
                                  style: GoogleFonts.mulish(
                                    color: pyellow,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ],
                      ))
                ],
              ),
            ),
          )),
    );
  }

  void show(BuildContext context, String message) {
    showGeneralDialog(
      context: context,
      pageBuilder: (ctx, a1, a2) {
        return CustomToast(message: message);
      },
      barrierDismissible: true,
      barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
      barrierColor: Colors.black54,
      // transitionBuilder: (ctx, a1, a2, child) {
      //   return SlideTransition(
      //       position:
      //           Tween(begin: Offset(0, -1), end: Offset(0, 0)).animate(a1),
      //       child: child);
      // },
      // transitionDuration: Duration(milliseconds: 700)
    );
  }
}
