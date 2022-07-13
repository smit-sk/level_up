import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:levelup/util/color.dart';
import 'package:levelup/util/decoration.dart';
import 'package:levelup/util/images.dart';
import 'package:levelup/view/base/BigCustomRadioButton.dart';
import 'package:levelup/view/base/CustomButton.dart';
import 'package:levelup/view/base/CustomDropDown.dart';
import 'package:levelup/view/base/CustomTextField.dart';
import 'package:levelup/view/base/Meal%20Plan%20Base/SimpleIngredients.dart';

class EditRecipeMealPlan extends StatefulWidget {
  const EditRecipeMealPlan({Key? key}) : super(key: key);

  @override
  State<EditRecipeMealPlan> createState() => _EditRecipeMealPlanState();
}

class _EditRecipeMealPlanState extends State<EditRecipeMealPlan> {
  List measurementlist = ["Cup", "Tea"];
  String measurement = "Cup";
  bool isSelected = false;
  bool isImperial = true;
  bool isMetric = false;
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
            "Edit Food",
            style: textStyleAppBar,
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.fromLTRB(0, 20, 0, 30),
            alignment: Alignment.center,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Cheesy-Crust Skillet Pizza",
                  style: mulish22700,
                ),
                SizedBox(
                  height: _height * 3,
                ),
                SimpleIngredients(
                  imagepath: logo,
                  mainIngredients: "Almond Milk",
                  subIngredients: "unsweeted,Plain, Shelf Stable",
                  isSelected: isSelected,
                  onTap: () {
                    setState(() {
                      isSelected = !isSelected;
                    });
                  },
                ),
                SimpleIngredients(
                  imagepath: logo,
                  mainIngredients: "Almond Milk",
                  subIngredients: "unsweeted,Plain, Shelf Stable",
                  isSelected: isSelected,
                  onTap: () {
                    setState(() {
                      isSelected = !isSelected;
                    });
                  },
                ),
                SimpleIngredients(
                  imagepath: logo,
                  mainIngredients: "Almond Milk",
                  subIngredients: "unsweeted,Plain, Shelf Stable",
                  isSelected: isSelected,
                  onTap: () {
                    setState(() {
                      isSelected = !isSelected;
                    });
                  },
                ),
                SizedBox(
                  height: _height * 2,
                ),
                BigCustomRadioBUtton(
                    height: _height * 7,
                    width: _width * 90,
                    isSelectedLeftText: isImperial,
                    isSelectedRightText: isMetric,
                    LeftText: "Imperial",
                    RightText: "Metric",
                    onTap: () {
                      setState(() {
                        this.isImperial = !isImperial;
                        this.isMetric = !isMetric;
                      });
                    }),
                SizedBox(
                  height: _height * 3,
                ),
                Text(
                  "Qty",
                  style: GoogleFonts.mulish(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      color: lightgrey),
                ),
                SizedBox(
                  height: _height * 2,
                ),
                CustomTextFeild(
                    height: _height * 7,
                    width: _width * 90,
                    lableText: "",
                    onChanged: (value) {},
                    isObscureText: false,
                    isError: false),
                SizedBox(
                  height: _height * 3,
                ),
                Text(
                  "Measurement",
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
                    dropdownWidth: _width * 50,
                    datalist: measurementlist,
                    selectedData: measurement,
                    onChanged: (value) {
                      setState(() {
                        measurement = value!;
                      });
                    }),
                SizedBox(
                  height: _height * 4,
                ),
                CustomButton(
                    width: _width * 90,
                    height: _height * 7,
                    lableText: "Save",
                    onPressed: () {}),
                SizedBox(
                  height: _height * 4,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
