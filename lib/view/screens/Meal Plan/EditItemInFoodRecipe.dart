import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:levelup/controller/add_foodrecipe_controller.dart';
import 'package:levelup/util/color.dart';
import 'package:levelup/util/decoration.dart';
import 'package:levelup/util/images.dart';
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
                EdgeInsets.fromLTRB(_width * 5, _height * 2.5, _width * 5, 0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: addfoodrecipecontroller
                          .editItemIngredientsList.length,
                      itemBuilder: ((context, index) {
                        return IngredientwithCalary(
                          heading: addfoodrecipecontroller
                              .editItemIngredientsList[index].mainIngredients,
                          subheading: addfoodrecipecontroller
                              .editItemIngredientsList[index]
                              .subIngredientsName,
                          onTap: () {
                            //addfoodrecipecontroller.selectIngredients(index);
                          },
                          isSelected: addfoodrecipecontroller
                              .editItemIngredientsList[index].isSelected,
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
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}
