import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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

class EditFood extends StatefulWidget {
  const EditFood({Key? key}) : super(key: key);

  @override
  State<EditFood> createState() => _EditFoodState();
}

class _EditFoodState extends State<EditFood> {
  List measurementlist = ["Cup", "Tea"];
  String measurement = "Cup";

  bool isSelected = true;
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
            alignment: Alignment.center,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
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
                  height: _height * 3,
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
                      fontSize: 14, fontWeight: FontWeight.w700, color: lightgrey),
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
                      fontSize: 14, fontWeight: FontWeight.w700, color: lightgrey),
                ),
                SizedBox(
                  height: _height * 2,
                ),
                CustomDropDownMenu(
                    height: _height * 7,
                    width: _width * 90,
                    datalist: measurementlist,
                    dropdownWidth: _width * 50,
                    selectedData: measurement,
                    onChanged: (value) {
                      setState(() {
                        measurement = value!;
                      });
                    }),
                SizedBox(
                  height: _height * 2,
                ),
                CustomButton(
                    width: _width * 90,
                    height: _height * 7,
                    lableText: "Save",
                    onPressed: () {})
              ],
            ),
          ),
        ),
      ),
    );
  }
}
