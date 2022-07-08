import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:levelup/helper/routeHelper.dart';
import 'package:levelup/util/decoration.dart';
import 'package:levelup/util/images.dart';
import 'package:levelup/view/base/CustomButton.dart';
import 'package:levelup/view/base/CustomTextField.dart';
import 'package:levelup/view/screens/Auth/Sign%20In/resetPasswordDone.dart';

import '../../../../util/color.dart';

class ResetPasswordDone extends StatefulWidget {
  const ResetPasswordDone({Key? key}) : super(key: key);

  @override
  State<ResetPasswordDone> createState() => _ResetPasswordDoneState();
}

class _ResetPasswordDoneState extends State<ResetPasswordDone> {
  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width * 0.01;
    double _height = MediaQuery.of(context).size.height * 0.01;
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
        fit: BoxFit.cover,
        image: AssetImage(bgimage2),
        
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
                    height: _height * 12,
                  ),
                  Image.asset(
                    resetDone,
                    scale: 4,
                  ),
                  SizedBox(
                    height: _height * 7,
                  ),
                  Text(
                    "Check your email\n to set a new password",
                    textAlign: TextAlign.center,
                    style: textStyleHeading,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "An email has just been sent to\n you with a link to reset\n your password.",
                    textAlign: TextAlign.center,
                    style: textStylesubHeading,
                  ),
                  SizedBox(
                    height: _height * 3,
                  ),
                  CustomButton(
                    width: _width * 85,
                    height: _height * 7,
                    lableText: "Go back to Sin In ",
                    onPressed: () {
                      Get.offAndToNamed(RouteHelper.getSIgnInRoute());
                    },
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
