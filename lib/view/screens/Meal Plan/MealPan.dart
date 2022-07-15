// ignore_for_file: sort_child_properties_last, prefer_const_constructors, prefer_final_fields
import 'package:drag_and_drop_lists/drag_and_drop_lists.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:levelup/controller/meal_plan_controller.dart';
import 'package:levelup/helper/routeHelper.dart';
import 'package:levelup/util/color.dart';
import 'package:levelup/util/decoration.dart';
import 'package:levelup/util/images.dart';
import 'package:levelup/view/base/CustomButton.dart';
import 'package:levelup/view/base/CustomToast.dart';
import 'package:levelup/view/base/Meal%20Plan%20Base/ExpansionContainer.dart';
import 'package:levelup/view/base/Meal%20Plan%20Base/IngrediansContainer.dart';
import 'package:levelup/view/base/Meal%20Plan%20Base/calaryChart.dart';
import 'package:levelup/view/base/Meal%20Plan%20Base/calaryTable.dart';
import 'package:levelup/view/screens/Meal%20Plan/ClearDay.dart';
import 'package:levelup/view/screens/Meal%20Plan/CopyDay.dart';

class MealPlan extends StatefulWidget {
  const MealPlan({Key? key}) : super(key: key);
  @override
  State<MealPlan> createState() => _MealPlanState();
}

class _MealPlanState extends State<MealPlan> {
  bool _breakfast = false;
  bool _lunch = false;
  bool _dinner = false;

  bool isSelect = false;
  ScrollController _scrollController = ScrollController();

  List<DragAndDropList> _data = [
    DragAndDropList(children: [
      DragAndDropItem(
          child: IngrediansContainer(
        isSelected: true,
        isDragable: true,
      )),
      DragAndDropItem(
          child: IngrediansContainer(
        isDragable: true,
      )),
      DragAndDropItem(
          child: IngrediansContainer(
        isDragable: true,
      ))
    ]),
  ];

  final GlobalKey<ScaffoldState> _scaffoldkey = GlobalKey<ScaffoldState>();
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
          key: _scaffoldkey,
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
                    _scaffoldkey.currentState!.showBottomSheet(
                        (context) =>
                            mealPlanBottomSheet(_height, _width, context),
                        backgroundColor: transperant);
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
            child:
                GetBuilder<MealPlanController>(builder: (mealplanController) {
              return Container(
                padding: EdgeInsets.symmetric(horizontal: _width * 5),
                alignment: Alignment.center,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 100,
                      child: ListView.builder(
                          physics: BouncingScrollPhysics(),
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount: mealplanController.weekDayDateList.length,
                          itemBuilder: (context, index) {
                            print("${mealplanController.weekDayDateList}");
                            return GestureDetector(
                              onTap: () {
                                mealplanController.changeSelectedDate(index);
                              },
                              child: Container(
                                margin: EdgeInsets.fromLTRB(0, 20, 15, 20),
                                padding: EdgeInsets.fromLTRB(40, 0, 40, 0),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: mealplanController
                                            .weekDayDateList[index].isSelected
                                        ? white
                                        : transperant,
                                    border: Border.all(
                                      color: white,
                                    )),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      mealplanController
                                          .weekDayDateList[index].day,
                                      style: GoogleFonts.mulish(
                                          fontSize: 16,
                                          color: mealplanController
                                                  .weekDayDateList[index]
                                                  .isSelected
                                              ? primary
                                              : white,
                                          fontWeight: FontWeight.w700),
                                    ),
                                    Text(
                                      mealplanController
                                          .weekDayDateList[index].date
                                          .toString(),
                                      style: GoogleFonts.mulish(
                                          fontSize: 12,
                                          color: mealplanController
                                                  .weekDayDateList[index]
                                                  .isSelected
                                              ? primary
                                              : white,
                                          fontWeight: FontWeight.w600),
                                    )
                                  ],
                                ),
                              ),
                            );
                          }),
                    ),
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
                    CalaryChart(
                      data: mealplanController.chartData,
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
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              _breakfast = !_breakfast;
                            });
                          },
                          child: Container(
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
                    _breakfast
                        ? Container(
                            margin:
                                EdgeInsets.symmetric(vertical: _height * 2.5),
                            child:
                                CalaryChart(data: mealplanController.chartData))
                        : SizedBox(
                            height: _height * 2.5,
                          ),
                    Container(
                      width: _width * 90,
                      child: DragAndDropLists(
                        disableScrolling: true,

                        children: [
                          DragAndDropList(children: [
                            DragAndDropItem(
                                child: IngrediansContainer(
                              isSelected: true,
                              isDragable:
                                  mealplanController.isRearrangePortionLock,
                            )),
                            DragAndDropItem(
                                child: IngrediansContainer(
                              isDragable:
                                  mealplanController.isRearrangePortionLock,
                            )),
                            DragAndDropItem(
                                child: IngrediansContainer(
                              isDragable:
                                  mealplanController.isRearrangePortionLock,
                            ))
                          ]),
                        ],
                        onItemReorder: _onItemReorder,
                        onListReorder: _onListReorder,
                        itemDecorationWhileDragging: BoxDecoration(
                          color: transperant,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 2,
                              blurRadius: 3,
                              // changes position of shadow
                            ),
                          ],
                        ),
                        listPadding: EdgeInsets.all(0),
                        lastItemTargetHeight: 0,
                        // axis: Axis.horizontal,
                        // listWidth: _width * 88,

                        addLastItemTargetHeightToTop: false,
                        lastListTargetSize: _height * 2.5,
                        itemDragHandle: DragHandle(
                          onLeft: true,
                          child: Padding(
                            padding: EdgeInsets.only(bottom: 80, left: 5),
                            child: Icon(
                              Icons.drag_indicator_outlined,
                              color: mealplanController.isRearrangePortionLock
                                  ? grey
                                  : transperant,
                            ),
                          ),
                        ),
                      ),
                    ),
                    IngrediansContainer(
                      isDragable: mealplanController.isRearrangePortionLock,
                    ),
                    SizedBox(
                      height: _height * 2.5,
                    ),
                    ExpansionContainer(
                      isDragable: mealplanController.isRearrangePortionLock,
                      isSelected: isSelect,
                      onTap: () {
                        setState(() {
                          isSelect = !isSelect;
                        });
                      },
                    ),
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
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              _lunch = !_lunch;
                            });
                          },
                          child: Container(
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
                    _lunch
                        ? Container(
                            margin:
                                EdgeInsets.symmetric(vertical: _height * 2.5),
                            child:
                                CalaryChart(data: mealplanController.chartData))
                        : SizedBox(
                            height: _height * 2.5,
                          ),
                    ExpansionContainer(
                      isDragable: mealplanController.isRearrangePortionLock,
                    ),
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
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              _dinner = !_dinner;
                            });
                          },
                          child: Container(
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
                    _dinner
                        ? Container(
                            margin:
                                EdgeInsets.symmetric(vertical: _height * 2.5),
                            child:
                                CalaryChart(data: mealplanController.chartData))
                        : SizedBox(
                            height: _height * 2.5,
                          ),
                    IngrediansContainer(
                      isDragable: mealplanController.isRearrangePortionLock,
                    ),
                    SizedBox(
                      height: _height * 2.5,
                    ),
                    ExpansionContainer(
                      isDragable: mealplanController.isRearrangePortionLock,
                    ),
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
                        onPressed: () {
                          Get.toNamed(
                              RouteHelper.getAddFoodRecipeMealPlanRoute());
                        }),
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
                    CalaryTable()
                  ],
                ),
              );
            }),
          )),
    );
  }

  _onItemReorder(
      int oldItemIndex, int oldListIndex, int newItemIndex, int newListIndex) {
    setState(() {
      var movedItem = _data[oldListIndex].children.removeAt(oldItemIndex);
      _data[newListIndex].children.insert(newItemIndex, movedItem);
    });
  }

  _onListReorder(int oldListIndex, int newListIndex) {
    setState(() {
      var movedList = _data.removeAt(oldListIndex);
      _data.insert(newListIndex, movedList);
    });
  }

  void showSuggestion(BuildContext context, String message) {
    showGeneralDialog(
      context: context,
      pageBuilder: (ctx, a1, a2) {
        return CustomToast(message: message);
      },
      barrierDismissible: true,
      barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
      barrierColor: Colors.black54,
    );
  }

  mealPlanBottomSheet(_height, _width, context) {
    List<MealPlanBottomSheetModel> mealPlanBottomSheetDataList = [
      MealPlanBottomSheetModel(
        heading: "Rearrange/Portion Lock",
        text: "Manage the meal plan list accordingly to your diet.",
        icon: rearrangePortionLock,
      ),
      MealPlanBottomSheetModel(
        heading: "Copy Day",
        text: "Copy a meal plan from one day to another.",
        icon: copyDay,
      ),
      MealPlanBottomSheetModel(
        heading: "customize meal labels",
        text: "Manage the meal label name accordingly to your plan.",
        icon: mealLabels,
      ),
      MealPlanBottomSheetModel(
        heading: "Clear Day",
        text: "Clear all the meal plan list of the days.",
        icon: clearDay,
      ),
    ];

    return GetBuilder<MealPlanController>(builder: (mealPlanController) {
      return Container(
        height: _height * 90,
        padding: EdgeInsets.fromLTRB(
            _width * 5, _height * 2.5, _width * 5, _height * 2.5),
        // ignore: prefer_const_constructors
        decoration: BoxDecoration(
            color: darkprimary,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20.0),
                topRight: Radius.circular(20.0))),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Align(
                alignment: Alignment.center,
                child: Image.asset(
                  drag,
                  scale: 3,
                ),
              ),
              SizedBox(
                height: _height * 5,
              ),
              ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: mealPlanBottomSheetDataList.length,
                  itemBuilder: ((context, index) {
                    return GestureDetector(
                      onTap: () {
                        mealPlanController.updateselectedMealPlanBSitem(
                            mealPlanController.selectedBottomSheetitemIndex !=
                                    index
                                ? index
                                : 5);

                        if (index == 1) {
                          Get.to(CopyDayMealPlan());
                        } else if (index == 3) {
                          Get.to(() => ClearDay());
                        } else if (index == 0) {
                          if (Get.find<MealPlanController>()
                              .isRearrangePortionLock) {
                            Get.find<MealPlanController>()
                                .updateRearrangePortionLock(false);
                          } else {
                            Get.find<MealPlanController>()
                                .updateRearrangePortionLock(true);
                          }
                        }

                        if (index != 0) {
                          Get.find<MealPlanController>()
                              .updateRearrangePortionLock(false);
                        }
                      },
                      child: Container(
                        margin: EdgeInsets.only(bottom: _height * 3),
                        padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
                        child: Row(
                          children: [
                            Container(
                              width: _width * 10,
                              child: SvgPicture.asset(
                                mealPlanBottomSheetDataList[index].icon,
                                color: mealPlanController
                                            .selectedBottomSheetitemIndex ==
                                        index
                                    ? primary
                                    : white,
                              ),
                            ),
                            SizedBox(
                              width: _width * 5,
                            ),
                            Flexible(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    mealPlanBottomSheetDataList[index].heading,
                                    style: GoogleFonts.mulish(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w700,
                                        color: mealPlanController
                                                    .selectedBottomSheetitemIndex ==
                                                index
                                            ? primary
                                            : white),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    mealPlanBottomSheetDataList[0].text,
                                    style: GoogleFonts.mulish(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                        color: mealPlanController
                                                    .selectedBottomSheetitemIndex ==
                                                index
                                            ? primary
                                            : lightgrey),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                        decoration: BoxDecoration(
                            color: mealPlanController
                                        .selectedBottomSheetitemIndex ==
                                    index
                                ? white
                                : transperant,
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(color: lightgrey)),
                      ),
                    );
                  }))
            ],
          ),
        ),
      );
    });
  }
}

class MealPlanBottomSheetModel {
  final String heading;
  final String text;
  final String icon;

  MealPlanBottomSheetModel({
    required this.heading,
    required this.text,
    required this.icon,
  });
}
