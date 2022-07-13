// ignore_for_file: prefer_const_constructors, sort_child_properties_last
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart';
import 'package:flutter_rounded_date_picker/flutter_rounded_date_picker.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:levelup/helper/routeHelper.dart';
import 'package:levelup/util/color.dart';
import 'package:levelup/util/decoration.dart';
import 'package:levelup/util/images.dart';
import 'package:levelup/view/base/BigCustomRadioButton.dart';
import 'package:levelup/view/base/CustomButton.dart';
import 'package:levelup/view/base/CustomRadioButton.dart';
import 'package:levelup/view/base/CustomTextField.dart';
import 'package:levelup/view/base/CustomTextFieldSuffix.dart';
import 'package:levelup/view/base/ErrorTextField.dart';
import 'package:levelup/view/screens/Auth/CreateNewAccount/step02CreateAccount.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:intl/intl.dart';

class Step01CreateAccount extends StatefulWidget {
  const Step01CreateAccount({Key? key}) : super(key: key);

  @override
  State<Step01CreateAccount> createState() => _Step01CreateAccountState();
}

class _Step01CreateAccountState extends State<Step01CreateAccount> {
  bool isMale = false;
  bool isFemale = true;

  bool isUSstandard = true;
  bool isMetric = false;

  String MetricHeight = "";
  TextEditingController _heightController = TextEditingController();

  List usStandardList1 = ["1 feet", "2 feet"];
  String selectedUsStandardHeight = "1 feet";

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width * 0.01;
    double _height = MediaQuery.of(context).size.height * 0.01;
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
        fit: BoxFit.cover,
        image: AssetImage(bgimage4),
      )),
      child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Container(
            width: _width * 100,
            margin: EdgeInsets.only(top: 70),
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
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
                    height: _height * 10,
                  ),
                  Text(
                    "Tell us about yourself",
                    style: textStyleHeading,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    "This info helps us to estimate\n your caloric needs",
                    textAlign: TextAlign.center,
                    style: textStylesubHeading,
                  ),
                  SizedBox(
                    height: _height * 4,
                  ),
                  Center(
                    child: Text(
                      "Step 1 of 5",
                      textAlign: TextAlign.center,
                      style: textStyleButton,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  LinearPercentIndicator(
                    alignment: MainAxisAlignment.center,
                    barRadius: Radius.circular(10),
                    width: _width * 30,
                    lineHeight: 10.0,
                    percent: 0.2,
                    backgroundColor: white,
                    progressColor: primary,
                  ),
                  SizedBox(
                    height: _height * 4,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: _width * 5),
                    alignment: Alignment.centerLeft,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Birthday",
                          style: GoogleFonts.mulish(
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                              color: lightgrey),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                            height: _height * 7,
                            width: _width * 90,
                            padding: EdgeInsets.all(10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Date of birth",
                                  style: GoogleFonts.mulish(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                      color: lightgrey),
                                ),
                                IconButton(
                                  onPressed: () {
                                    // showDatePicker(
                                    //     firstDate: DateTime(2022),
                                    //     lastDate: DateTime(2092),
                                    //     context: context,
                                    //     initialDate: DateTime.now(),
                                    //     initialDatePickerMode:
                                    //         DatePickerMode.year);
                                    DatePickerDialog(_height * 80);
                                  },
                                  icon: Icon(
                                    Icons.calendar_month_sharp,
                                  ),
                                  color: lightgrey,
                                )
                              ],
                            ),
                            decoration: BoxDecoration(
                              border: Border.all(color: lightgrey),
                              borderRadius: BorderRadius.circular(10),
                            )),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          "Please select which sex we should use to\ncalculate your calorie needs:",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.mulish(
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                              color: lightgrey),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            CustomRadioButton(
                              height: _height * 7,
                              width: _width * 42.5,
                              icon: Icons.woman,
                              text: "Female",
                              isSelected: isFemale,
                              onTap: () {
                                setState(() {
                                  isFemale = !isFemale;
                                  isMale = !isMale;
                                });
                              },
                            ),
                            SizedBox(
                              width: _width * 5,
                            ),
                            CustomRadioButton(
                              height: _height * 7,
                              width: _width * 42.5,
                              icon: Icons.man,
                              text: "Male",
                              isSelected: isMale,
                              onTap: () {
                                setState(() {
                                  isFemale = !isFemale;
                                  isMale = !isMale;
                                });
                              },
                            )
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          "Height",
                          style: GoogleFonts.mulish(
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                              color: lightgrey),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        BigCustomRadioBUtton(
                            height: _height * 7,
                            width: _width * 88,
                            isSelectedLeftText: isUSstandard,
                      isSelectedRightText: isMetric,
                      LeftText: "U.S. Standard",
                      RightText: "Metric",
                            onTap: () {
                              setState(() {
                                isUSstandard = !isUSstandard;
                                isMetric = !isMetric;
                              });
                            }),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  isUSstandard
                      ? Container(
                          width: _width * 90,
                          child: Row(
                            children: [
                              Container(
                                height: _height * 7,
                                width: _width * 42.5,
                                child: DropdownButtonHideUnderline(
                                  child: DropdownButton2(
                                    isExpanded: true,
                                    hint: Row(
                                      children: [
                                        Icon(
                                          Icons.list,
                                          size: 16,
                                          color: Colors.yellow,
                                        ),
                                        SizedBox(
                                          width: 4,
                                        ),
                                        Expanded(
                                          child: Text(
                                            'Select Item',
                                            style: GoogleFonts.mulish(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w700,
                                              color: white,
                                            ),
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                      ],
                                    ),
                                    items: usStandardList1
                                        .map((item) => DropdownMenuItem<String>(
                                              value: item,
                                              child: Text(
                                                item,
                                                style: GoogleFonts.mulish(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w700,
                                                  color: white,
                                                ),
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            ))
                                        .toList(),
                                    value: selectedUsStandardHeight,
                                    onChanged: (value) {
                                      setState(() {
                                        selectedUsStandardHeight =
                                            value as String;
                                      });
                                    },
                                    icon: const Icon(
                                      Icons.expand_more,
                                      size: 25,
                                    ),
                                    iconSize: 14,
                                    iconEnabledColor: white,
                                    iconDisabledColor: Colors.grey,
                                    // buttonHeight: 50,
                                    // buttonWidth: 160,
                                    buttonPadding: const EdgeInsets.only(
                                        left: 14, right: 14),
                                    buttonDecoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(
                                        color: white,
                                      ),
                                      color: transperant,
                                    ),
                                    buttonElevation: 2,
                                    itemHeight: 40,
                                    itemPadding: const EdgeInsets.only(
                                        left: 14, right: 14),
                                    dropdownMaxHeight: 200,
                                    dropdownWidth: _width * 30,
                                    dropdownPadding: null,
                                    dropdownDecoration: BoxDecoration(
                                      border: Border.all(color: grey),
                                      borderRadius: BorderRadius.circular(10),
                                      color: transperant,
                                    ),
                                    dropdownElevation: 8,
                                    scrollbarRadius: const Radius.circular(40),
                                    scrollbarThickness: 6,
                                    scrollbarAlwaysShow: true,
                                    offset: const Offset(10, 0),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: _width * 5,
                              ),
                              Container(
                                height: _height * 7,
                                width: _width * 42.5,
                                child: DropdownButtonHideUnderline(
                                  child: DropdownButton2(
                                    isExpanded: true,
                                    hint: Row(
                                      children: [
                                        Icon(
                                          Icons.list,
                                          size: 16,
                                          color: Colors.yellow,
                                        ),
                                        SizedBox(
                                          width: 4,
                                        ),
                                        Expanded(
                                          child: Text(
                                            'Select Item',
                                            style: GoogleFonts.mulish(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w700,
                                              color: white,
                                            ),
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                      ],
                                    ),
                                    items: usStandardList1
                                        .map((item) => DropdownMenuItem<String>(
                                              value: item,
                                              child: Text(
                                                item,
                                                style: GoogleFonts.mulish(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w700,
                                                  color: white,
                                                ),
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            ))
                                        .toList(),
                                    value: selectedUsStandardHeight,
                                    onChanged: (value) {
                                      setState(() {
                                        selectedUsStandardHeight =
                                            value as String;
                                      });
                                    },
                                    icon: const Icon(
                                      Icons.expand_more,
                                      size: 25,
                                    ),
                                    iconSize: 14,
                                    iconEnabledColor: white,
                                    iconDisabledColor: Colors.grey,
                                    buttonPadding: const EdgeInsets.only(
                                        left: 14, right: 14),
                                    buttonDecoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(
                                        color: white,
                                      ),
                                      color: transperant,
                                    ),
                                    buttonElevation: 2,
                                    itemHeight: 40,
                                    itemPadding: const EdgeInsets.only(
                                        left: 14, right: 14),
                                    dropdownMaxHeight: 200,
                                    dropdownWidth: _width * 30,
                                    dropdownPadding: null,
                                    dropdownDecoration: BoxDecoration(
                                      border: Border.all(color: grey),
                                      borderRadius: BorderRadius.circular(10),
                                      color: transperant,
                                    ),
                                    dropdownElevation: 8,
                                    scrollbarRadius: const Radius.circular(40),
                                    scrollbarThickness: 6,
                                    scrollbarAlwaysShow: true,
                                    offset: const Offset(10, 0),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                      : CustormTextFieldSuffix(
                          height: _height * 7,
                          widthContainer: _width * 90,
                          widthTextField: _width * 60,
                          controller: _heightController,
                          textInputType: TextInputType.number,
                          onChanged: (value) {
                            setState(() {
                              this.MetricHeight = value;
                            });
                          },
                          suffixText: "cm"),
                  SizedBox(
                    height: _height * 3,
                  ),
                  CustomButton(
                    width: _width * 90,
                    height: _height * 7,
                    lableText: "Next",
                    onPressed: () {
                      Get.toNamed(RouteHelper.getStep02CreateAccountRoute());
                    },
                  ),
                  SizedBox(
                    height: 30,
                  )
                ],
              ),
            ),
          )),
    );
  }

  Future DatePickerDialog(height) async {
    return getDateRangePicker();
    // return showRoundedDatePicker(
    //     context: context,
    //     initialDate: DateTime.now(),
    //     firstDate: DateTime(DateTime.now().year - 1),
    //     lastDate: DateTime(DateTime.now().year + 1),
    //     borderRadius: 16,
    //     height: 400);
  }

  Widget getDateRangePicker() {
    return Container(
      child: CalendarCarousel(
        
      ),
      //     child: Card(
      //         child: SfDateRangePicker(
      //   initialSelectedDate: DateTime.now(),
      //   view: DateRangePickerView.month,
      //   selectionMode: DateRangePickerSelectionMode.single,
      //   onSelectionChanged: selectionChanged,
      // )
      // )
    );
  }

  void selectionChanged(DateRangePickerSelectionChangedArgs args) {
    String _selectedDate = DateFormat('dd MMMM, yyyy').format(args.value);

    // SchedulerBinding.instance!.addPostFrameCallback((duration) {
    //   setState(() {});
    // });
  }
}
