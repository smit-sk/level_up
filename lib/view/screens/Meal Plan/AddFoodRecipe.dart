// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:levelup/controller/add_foodrecipe_controller.dart';
import 'package:levelup/util/color.dart';
import 'package:levelup/util/decoration.dart';
import 'package:levelup/util/images.dart';
import 'package:levelup/view/base/BigCustomRadioButton.dart';
import 'package:levelup/view/base/Meal%20Plan%20Base/IngredientswithCalary.dart';
import 'package:levelup/view/screens/Meal%20Plan/EditItemInFoodRecipe.dart';
import 'package:levelup/view/screens/Meal%20Plan/FilterFoodRecipe.dart';

class AddFoodRecipe extends StatelessWidget {
  const AddFoodRecipe({Key? key}) : super(key: key);

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
            "Add Food/Recipe",
            style: textStyleAppBar,
          ),
        ),
        body: GetBuilder<AddFoodRecipeController>(
            builder: (addfoodrecipecontroller) {
          return Container(
              padding:
                  EdgeInsets.fromLTRB(_width * 5, _height * 2.5, _width * 5, 0),
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Container(
                    height: double.infinity,
                    child: SingleChildScrollView(
                      physics: BouncingScrollPhysics(),
                      child: Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(color: white)),
                            padding: EdgeInsets.only(right: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  width: _width * 70,
                                  child: TextFormField(
                                    cursorColor: white,
                                    keyboardType: TextInputType.text,
                                    textAlign: TextAlign.start,
                                    style: GoogleFonts.mulish(
                                        fontSize: 16,
                                        color: white,
                                        fontWeight: FontWeight.w700),
                                    onChanged: addfoodrecipecontroller
                                        .onItemChangedFoodsList,
                                    decoration: InputDecoration(
                                      prefixIcon: Icon(
                                        Icons.search,
                                        color: white,
                                        size: 30,
                                      ),
                                      hintText: "Search Food/recipe",
                                      hintStyle: GoogleFonts.poppins(
                                          color: grey,
                                          fontSize: 16,
                                          fontWeight: FontWeight.normal),
                                      fillColor: Colors.transparent,
                                      isDense: true,
                                      contentPadding:
                                          EdgeInsets.fromLTRB(10, 10, 10, 10),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: transperant, width: 0),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      border: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: transperant, width: 0),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                    ),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Get.to(FilterFoodRecipe());
                                  },
                                  child: Stack(
                                    children: <Widget>[
                                      Container(
                                        width: 55,
                                        height: 35,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            Text(
                                              "|",
                                              style: GoogleFonts.poppins(
                                                color: grey,
                                                fontSize: 18,
                                              ),
                                            ),
                                            SvgPicture.asset(
                                              filterIcon,
                                              color: white,
                                            ),
                                          ],
                                        ),
                                      ),
                                      addfoodrecipecontroller.filterBadge != 0
                                          ? Positioned(
                                              right: 0,
                                              top: 0,
                                              child: Container(
                                                width: 20,
                                                height: 20,
                                                alignment: Alignment.center,
                                                decoration: BoxDecoration(
                                                  color: primary,
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                ),
                                                child: Text(
                                                  addfoodrecipecontroller
                                                      .filterBadge
                                                      .toString(),
                                                  style: mulish14700,
                                                  textAlign: TextAlign.center,
                                                ),
                                              ),
                                            )
                                          : SizedBox.shrink()
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          BigCustomRadioBUtton(
                              height: _height * 7,
                              width: _width * 90,
                              isSelectedLeftText:
                                  addfoodrecipecontroller.isFood,
                              isSelectedRightText:
                                  addfoodrecipecontroller.isRecipe,
                              LeftText: "Foods",
                              RightText: "Recipe",
                              onTap: () {
                                addfoodrecipecontroller.changeFoodsRecipe();
                              }),
                          SizedBox(
                            height: 20,
                          ),
                          ListView.builder(
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              itemCount: addfoodrecipecontroller
                                  .searchResultFoodsList.length,
                              itemBuilder: ((context, index) {
                                return IngredientwithCalary(
                                  heading: addfoodrecipecontroller
                                      .searchResultFoodsList[index].mainFoods,
                                  subheading: addfoodrecipecontroller
                                      .searchResultFoodsList[index]
                                      .subFoodsName,
                                  isRecipe: addfoodrecipecontroller.isRecipe,
                                  onTap: () {
                                    addfoodrecipecontroller.selectFoods(index);
                                  },
                                  isSelected: addfoodrecipecontroller
                                      .searchResultFoodsList[index].isSelected,
                                );
                              }))
                        ],
                      ),
                    ),
                  ),
                  addfoodrecipecontroller.selectedFoodsList.isNotEmpty
                      ? Container(
                          height: _height * 7,
                          margin: EdgeInsets.only(bottom: 20),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: const [
                                BoxShadow(
                                  color: Color.fromARGB(255, 26, 25, 25),
                                  blurRadius: 30.0,
                                ),
                                BoxShadow(
                                  color: Color.fromARGB(255, 26, 25, 25),
                                  blurRadius: 30.0,
                                ),
                                BoxShadow(
                                  color: Color.fromARGB(255, 26, 25, 25),
                                  blurRadius: 30.0,
                                ),
                              ]),
                          child: ElevatedButton(
                            onPressed: () {
                              addfoodrecipecontroller
                                  .addselectedListInEditItemlist();
                              Get.to(EditItemInFoodRecipe());
                            },
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(primary),
                                shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                        side: BorderSide(color: primary)))),
                            child: Center(
                              child: Text(
                                "Add(${addfoodrecipecontroller.selectedFoodsList.length})",
                                style: GoogleFonts.mulish(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                          ),
                        )
                      : SizedBox.shrink(),
                ],
              ));
        }),
      ),
    );
  }
}
