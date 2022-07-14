import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:levelup/controller/add_foodrecipe_controller.dart';
import 'package:levelup/controller/meal_plan_controller.dart';
import 'package:levelup/helper/routeHelper.dart';
import 'package:levelup/util/color.dart';
import 'package:levelup/util/images.dart';

class Dashboard extends StatelessWidget {
  Dashboard({Key? key}) : super(key: key);

  MealPlanController mealplanController = Get.put(MealPlanController());
  AddFoodRecipeController addFoodRecipeController =
      Get.put(AddFoodRecipeController());

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
            margin: EdgeInsets.fromLTRB(_width * 5, 70, _width * 5, 0),
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
                    height: _height * 7,
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.toNamed(RouteHelper.getMealPlanRoute());
                    },
                    child: Container(
                      margin: EdgeInsets.fromLTRB(
                          _width * 2.5, _height * 2, _width * 2.5, 10),
                      padding: EdgeInsets.fromLTRB(
                          _width * 5, _height * 2.5, 10, _height * 2.5),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: white)),
                      child: Row(
                        children: [
                          SizedBox(
                            height: _height * 4,
                            width: _width * 10,
                            child: SvgPicture.asset(
                              mealplan,
                            ),
                          ),
                          SizedBox(
                            width: _width * 5,
                          ),
                          Text(
                            "Meal Plan",
                            style: GoogleFonts.mulish(
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                                color: white),
                          ),
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      // Get.to(Test());
                    },
                    child: Container(
                      margin: EdgeInsets.fromLTRB(
                          _width * 2.5, _height * 2, _width * 2.5, 10),
                      padding: EdgeInsets.fromLTRB(
                          _width * 5, _height * 2.5, 10, _height * 2.5),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: white)),
                      child: Row(
                        children: [
                          SizedBox(
                            height: _height * 4,
                            width: _width * 10,
                            child: SvgPicture.asset(
                              foodsRecipendMeals,
                            ),
                          ),
                          SizedBox(
                            width: _width * 5,
                          ),
                          Text(
                            "Foods, Recipes & Meals",
                            style: GoogleFonts.mulish(
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                                color: white),
                          ),
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      margin: EdgeInsets.fromLTRB(
                          _width * 2.5, _height * 2, _width * 2.5, 10),
                      padding: EdgeInsets.fromLTRB(
                          _width * 5, _height * 2.5, 10, _height * 2.5),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: white)),
                      child: Row(
                        children: [
                          SizedBox(
                            height: _height * 4,
                            width: _width * 10,
                            child: SvgPicture.asset(
                              createRecipe,
                            ),
                          ),
                          SizedBox(
                            width: _width * 5,
                          ),
                          Text(
                            "Create Recipe",
                            style: GoogleFonts.mulish(
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                                color: white),
                          ),
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      margin: EdgeInsets.fromLTRB(
                          _width * 2.5, _height * 2, _width * 2.5, 10),
                      padding: EdgeInsets.fromLTRB(
                          _width * 5, _height * 2.5, 10, _height * 2.5),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: white)),
                      child: Row(
                        children: [
                          SizedBox(
                            height: _height * 4,
                            width: _width * 10,
                            child: SvgPicture.asset(
                              addWeighIn,
                            ),
                          ),
                          SizedBox(
                            width: _width * 5,
                          ),
                          Text(
                            "Add Weigh In ",
                            style: GoogleFonts.mulish(
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                                color: white),
                          ),
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      margin: EdgeInsets.fromLTRB(
                          _width * 2.5, _height * 2, _width * 2.5, 10),
                      padding: EdgeInsets.fromLTRB(
                          _width * 5, _height * 2.5, 10, _height * 2.5),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: white)),
                      child: Row(
                        children: [
                          SizedBox(
                            height: _height * 4,
                            width: _width * 10,
                            child: SvgPicture.asset(
                              profile,
                            ),
                          ),
                          SizedBox(
                            width: _width * 5,
                          ),
                          Text(
                            "Profile",
                            style: GoogleFonts.mulish(
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                                color: white),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          )),
    );
  }
}
