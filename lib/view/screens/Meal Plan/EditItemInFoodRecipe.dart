// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:levelup/controller/add_foodrecipe_controller.dart';
import 'package:levelup/util/color.dart';
import 'package:levelup/util/decoration.dart';
import 'package:levelup/util/images.dart';
import 'package:levelup/view/base/CustomButton.dart';
import 'package:levelup/view/base/CustomDropDown.dart';
import 'package:levelup/view/base/Meal%20Plan%20Base/IngredientswithCalary.dart';

class EditItemInFoodRecipe extends StatelessWidget {
  const EditItemInFoodRecipe({Key? key}) : super(key: key);

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
            "Edit Item",
            style: textStyleAppBar,
          ),
        ),
        body: GetBuilder<AddFoodRecipeController>(
            builder: (addfoodrecipecontroller) {
          return Container(
            padding:
                EdgeInsets.fromLTRB(_width * 6, _height * 2.5, _width * 6, 0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: addfoodrecipecontroller
                          .editItemFoodsList.length,
                      itemBuilder: ((context, index) {
                        return IngredientwithCalary(
                          heading: addfoodrecipecontroller
                              .editItemFoodsList[index].mainFoods,
                          subheading: addfoodrecipecontroller
                              .editItemFoodsList[index]
                              .subFoodsName,
                          onTap: () {
                            addfoodrecipecontroller
                                .selectAnyOneFoods(index);
                          },
                          isSelected: addfoodrecipecontroller
                              .editItemFoodsList[index].isSelected,
                        );
                      })),
                  SizedBox(
                    height: _height * 2,
                  ),
                  Text(
                    "Choose the meal",
                    style: GoogleFonts.mulish(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        color: lightgrey),
                  ),
                  SizedBox(
                    height: _height * 2,
                  ),
                  ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: Get.find<AddFoodRecipeController>()
                          .mealTypeList
                          .length,
                      itemBuilder: ((context, index) {
                        return Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 5, vertical: 4),
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
                                  value: Get.find<AddFoodRecipeController>()
                                      .mealTypeList[index]
                                      .isSelected,
                                  fillColor:
                                      MaterialStateProperty.all<Color>(white),
                                  checkColor: primary,
                                  onChanged: (value) {
                                    Get.find<AddFoodRecipeController>()
                                        .changeMealType(index, value);
                                  },
                                  shape: RoundedRectangleBorder(
                                      side: BorderSide(color: white, width: 1),
                                      borderRadius: BorderRadius.circular(4)),
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                Get.find<AddFoodRecipeController>()
                                    .mealTypeList[index]
                                    .mealName,
                                style: mulish16700,
                              )
                            ],
                          ),
                        );
                      })),
                  SizedBox(
                    height: _height * 2,
                  ),
                  Text(
                    "Select Day",
                    style: GoogleFonts.mulish(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        color: lightgrey),
                  ),
                  SizedBox(
                    height: _height * 2,
                  ),
                  CustomDropDownMenu(
                      height: _height * 7,
                      width: _width * 90,
                      dropdownWidth: _width * 80,
                      datalist:
                          Get.find<AddFoodRecipeController>().weekDayDateList,
                      selectedData:
                          Get.find<AddFoodRecipeController>().selectedDayDate,
                      dropdowncolor: black.withOpacity(0.5),
                      onChanged: (value) {
                        Get.find<AddFoodRecipeController>()
                            .changeDayDate(value);
                      }),
                  SizedBox(
                    height: _height * 2,
                  ),
                  CustomButton(
                      width: _width * 90,
                      height: _height * 7,
                      lableText: "Add",
                      onPressed: () {})
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}
