import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:levelup/util/decoration.dart';
import 'package:levelup/util/images.dart';
import 'package:levelup/view/base/CustomButton.dart';
import 'package:levelup/view/base/CustomTextField.dart';
import 'package:levelup/view/screens/Auth/resetPasswordDone.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({Key? key}) : super(key: key);

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  //final _formkey = GlobalKey<FormState>();
  String? email;
  // String? password;
  bool isError = false;
  String errorEmailText = "Enter valid email";
  //String errorPasswordText = "Enter valid Password";

  // validateForm() {
  //   bool emailValid = email == null
  //       ? false
  //       : RegExp(
  //               r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
  //           .hasMatch(email!);
  //   bool passValid = password != null ? password!.isNotEmpty : false;
  //   print("$emailValid $passValid");
  //   if (emailValid && passValid) {
  //   } else {
  //     setState(() {
  //       isError = true;
  //     });
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width * 0.01;
    double _height = MediaQuery.of(context).size.height * 0.01;
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
        fit: BoxFit.cover,
        image: AssetImage(bgimage2),
        colorFilter:
            ColorFilter.mode(Colors.black.withOpacity(0.3), BlendMode.dstATop),
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
                    "Reset your password",
                    style: textStyleHeading,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Enter the email address\n associated with youe account.",
                    textAlign: TextAlign.center,
                    style: textStylesubHeading,
                  ),
                  SizedBox(
                    height: _height * 3,
                  ),
                  CustomTextFeild(
                      height: _height * 7,
                      width: _width * 85,
                      isError: isError,
                      lableText: "Email Address",
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Enter Value";
                        } else {
                          return "";
                        }
                      },
                      onChanged: (value) {
                        setState(() {
                          this.email = value;
                        });
                      },
                      isObscureText: false),
                  isError
                      ? Container(
                          width: _width * 85,
                          margin: EdgeInsets.only(top: 5),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: SizedBox(
                              height: _height * 3,
                              child: Text(
                                errorEmailText,
                                style: GoogleFonts.poppins(
                                    color: Colors.red, fontSize: 12),
                              ),
                            ),
                          ),
                        )
                      : SizedBox(
                          height: _height * 3,
                        ),
                  CustomButton(
                    width: _width * 85,
                    height: _height * 7,
                    lableText: "Reset Password",
                    onPressed: () {
                      Get.to(ResetPasswordDone());
                    },
                  ),
                  SizedBox(
                    height: _height * 7,
                  ),
                  RichText(
                      text: TextSpan(
                          text: "Go back to ",
                          style: GoogleFonts.mulish(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w500),
                          children: [
                        TextSpan(
                          text: "Sign In",
                          style: GoogleFonts.mulish(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w700),
                        )
                      ])),
                ],
              ),
            ),
          )),
    );
  }
}
