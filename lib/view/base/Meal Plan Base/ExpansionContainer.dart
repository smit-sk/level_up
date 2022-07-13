import 'package:expansion_widget/expansion_widget.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:levelup/controller/meal_plan_controller.dart';
import 'package:levelup/util/color.dart';
import 'package:levelup/util/images.dart';

class ExpansionContainer extends StatefulWidget {
  bool isSelected;
  bool isDragable;
  Function()? onTap;

  ExpansionContainer({
    Key? key,
    this.isSelected = false,
    this.isDragable = false,
    this.onTap,
  }) : super(key: key);

  @override
  State<ExpansionContainer> createState() => _ExpansionContainerState();
}

class _ExpansionContainerState extends State<ExpansionContainer> {
  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width * 0.01;
    double _height = MediaQuery.of(context).size.height * 0.01;

    return GetBuilder<MealPlanController>(builder: (mealplancontroller) {
      return GestureDetector(
        onTap:widget.onTap,
        child: Container(
          decoration: BoxDecoration(
            color: widget.isSelected ? white : transperant,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: white),
          ),
          child: ExpansionWidget(
            titleBuilder:
                (_, double easeInValue, bool isExpaned, toogleFunction) {
              return Material(
                color: Color.lerp(transperant, transperant, easeInValue),
                child: Container(
                    width: _width * 90,
                    alignment: Alignment.center,
                    margin: EdgeInsets.only(bottom: _height * 2.5),
                    padding: EdgeInsets.fromLTRB(
                        _width * 7, _height * 2.5, _width * 5, 0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            Container(
                              height: _height * 8,
                              width: _width * 16,
                              decoration: BoxDecoration(
                                color: white,
                                image: DecorationImage(
                                  image: ExactAssetImage(logo),
                                  fit: BoxFit.cover,
                                ),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(50.0)),
                                border: Border.all(
                                  color: pgreen,
                                  width: 5.0,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: _width * 5,
                            ),
                            Flexible(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text(
                                    "Cheesy-Crust Skillet Pizza",
                                    style: GoogleFonts.mulish(
                                        color:
                                            widget.isSelected ? black : white,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w800),
                                  ),
                                  SizedBox(
                                    height: _height * 2,
                                  ),
                                  Text(
                                    "Recipe: 3 Ingredients",
                                    style: GoogleFonts.mulish(
                                        color:
                                            widget.isSelected ? black : white,
                                        fontSize: 13,
                                        fontWeight: FontWeight.w600),
                                  )
                                ],
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                toogleFunction(animated: true);
                              },
                              icon: Icon(
                                Icons.arrow_forward_ios,
                                color: widget.isSelected ? black : white,
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        widget.isDragable
                            ? SizedBox(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Divider(
                                      color: widget.isSelected ? black : grey,
                                      height: 10,
                                    ),
                                    SizedBox(
                                      height: _height * 1.5,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "Portion Lock",
                                          style: GoogleFonts.mulish(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w600,
                                            color: widget.isSelected
                                                ? black
                                                : white,
                                          ),
                                        ),
                                        FlutterSwitch(
                                          width: 55,
                                          borderRadius: 25,
                                          value: Get.find<MealPlanController>()
                                              .toggle,
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
                    )),
              );
            },
            content: ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: 4,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: _width * 5),
                        child: Divider(
                          color: grey,
                        ),
                      ),
                      Container(
                          alignment: Alignment.center,
                          padding: EdgeInsets.fromLTRB(_width * 5,
                              _height * 2.5, _width * 2, _height * 2.5),
                          child: Row(
                            children: [
                              Container(
                                height: _height * 8,
                                width: _width * 16,
                                decoration: BoxDecoration(
                                  color: white,
                                  image: DecorationImage(
                                    image: ExactAssetImage(logo),
                                    fit: BoxFit.cover,
                                  ),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(50.0)),
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
                                          color:
                                              widget.isSelected ? black : white,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w800),
                                      children: <TextSpan>[
                                        TextSpan(
                                          text:
                                              'unsweetened, plain, shelf stable',
                                          style: GoogleFonts.mulish(
                                              color: widget.isSelected
                                                  ? black
                                                  : white,
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
                                          color:
                                              widget.isSelected ? black : white,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w800),
                                      children: <TextSpan>[
                                        TextSpan(
                                          text: '240g',
                                          style: GoogleFonts.mulish(
                                              color: widget.isSelected
                                                  ? black
                                                  : white,
                                              fontSize: 13,
                                              fontWeight: FontWeight.w600),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          )),
                    ],
                  );
                }),
          ),
        ),
      );
    });
  }
}
