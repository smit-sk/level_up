import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:levelup/util/color.dart';
import 'package:levelup/util/decoration.dart';
import 'package:levelup/util/images.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MealPlan extends StatefulWidget {
  const MealPlan({Key? key}) : super(key: key);

  @override
  State<MealPlan> createState() => _MealPlanState();
}

class _MealPlanState extends State<MealPlan> {
  @override
  Widget build(BuildContext context) {
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
            "Meal Plan",
            style: textStyleAppBar,
          ),
          actions: [
            IconButton(
                onPressed: () {
                  show(context, "hello hunny bunny ");
                },
                icon: Icon(
                  Icons.more_vert,
                  size: 25,
                  color: white,
                ))
          ],
        ),
        body: Container(),
      ),
    );
  }

  void show(BuildContext context, String message) {
    showGeneralDialog(
      context: context,
      pageBuilder: (ctx, a1, a2) {
        return CustomToast(message: message);
      },
      barrierDismissible: true,
      barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
      barrierColor: Colors.black54,
      // transitionBuilder: (ctx, a1, a2, child) {
      //   return SlideTransition(
      //       position:
      //           Tween(begin: Offset(0, -1), end: Offset(0, 0)).animate(a1),
      //       child: child);
      // },
      // transitionDuration: Duration(milliseconds: 700)
    );
  }
}

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
        width: 200,
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
