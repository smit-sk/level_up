import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:levelup/controller/add_foodrecipe_controller.dart';
import 'package:levelup/util/color.dart';
import 'package:levelup/util/decoration.dart';
import 'package:levelup/util/images.dart';
import 'package:levelup/view/base/CustomButton.dart';

class FilterFoodRecipe extends StatelessWidget {
  const FilterFoodRecipe({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width * 0.01;
    double _height = MediaQuery.of(context).size.height * 0.01;
    var textStyleAppBar;
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
            "Filter",
            style: textStyleAppBar,
          ),
        ),
        body: GetBuilder<AddFoodRecipeController>(
            builder: (foodrecipecontroller) {
          return Container(
            padding:
                EdgeInsets.fromLTRB(_width * 5, _height * 2.5, _width * 5, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: _height * 2,
                ),
                ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount:
                        Get.find<AddFoodRecipeController>().mealTypeList.length,
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
                                    .filterlist[index]
                                    .isSelected,
                                fillColor:
                                    MaterialStateProperty.all<Color>(white),
                                checkColor: primary,
                                onChanged: (value) {
                                  Get.find<AddFoodRecipeController>()
                                      .changeFilterList(false, index);
                                },
                                shape: RoundedRectangleBorder(
                                    side: BorderSide(color: white, width: 1),
                                    borderRadius: BorderRadius.circular(4)),
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              Get.find<AddFoodRecipeController>()
                                  .filterlist[index]
                                  .mealName,
                              style: mulish16700,
                            )
                          ],
                        ),
                      );
                    })),
                SizedBox(
                  height: _height * 3,
                ),
                GestureDetector(
                    onTap: () {
                      foodrecipecontroller.changeFilterList(true);
                    },
                    child: Text(
                      "Clear All",
                      style: mulish16700,
                    )),
                SizedBox(
                  height: _height * 3,
                ),
                CustomButton(
                    width: _width * 90,
                    height: _height * 7,
                    lableText: "Save",
                    onPressed: () {
                      foodrecipecontroller.countFilterNumber();
                    })
              ],
            ),
          );
        }),
      ),
    );
  }
}
