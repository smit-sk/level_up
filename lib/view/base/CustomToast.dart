import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:levelup/util/color.dart';
import 'package:levelup/util/images.dart';

class CustomToast extends StatefulWidget {
  String? message;

  CustomToast({this.message});

  @override
  State<StatefulWidget> createState() {
    return _CustomToastState();
  }
}

class _CustomToastState extends State<CustomToast> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: EdgeInsets.only(top: kToolbarHeight),
      alignment: Alignment.topCenter,
      elevation: 2,
      backgroundColor: Colors.transparent,
      child: Container(
        width: 350,
        padding: EdgeInsets.fromLTRB(15, 10, 10, 10),
        decoration: BoxDecoration(
            color: primary, borderRadius: BorderRadius.circular(10.0)),
        child: Container(
          height: 100,
          child: Column(
            children: [
              Row(
                children: [
                  Container(
                    height: 35,
                    width: 35,
                    margin: EdgeInsets.only(right: 10),
                    child: Card(
                      elevation: 10,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5)),
                      child: Padding(
                        padding: EdgeInsets.all(5.0),
                        child: Center(
                          child: Image.asset(logo),
                        ),
                      ),
                    ),
                  ),
                  Text(
                    "Advanced Tip",
                    style: GoogleFonts.mulish(
                        color: white,
                        fontSize: 16,
                        fontWeight: FontWeight.w800),
                  )
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Click on the options on the top right and copy a meal plan from one day to another.",
                style: GoogleFonts.mulish(
                    fontSize: 13, fontWeight: FontWeight.w500, color: white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
