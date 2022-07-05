import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:levelup/util/color.dart';
import 'package:levelup/util/images.dart';
import 'package:levelup/view/screens/Auth/signInDefault.dart';

class SignInCreate extends StatelessWidget {
  const SignInCreate({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width * 0.01;
    double _height = MediaQuery.of(context).size.height * 0.01;
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
        fit: BoxFit.cover,
        image: AssetImage(bgimage),
        colorFilter:
            ColorFilter.mode(primary.withOpacity(0.5), BlendMode.dstATop),
      )),
      child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Container(
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.only(top: 70),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  logo,
                  scale: 4,
                ),
                SizedBox(
                  height: 30,
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
                  height: _height * 30,
                ),
                Container(
                  height: _height * 6.5,
                  width: _width * 80,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(10)),
                  child: Center(
                    child: Text(
                      "Sign in",
                      style: GoogleFonts.mulish(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  onTap: () {
                    Get.to(SignInDefault());
                  },
                  child: Container(
                    height: _height * 6.5,
                    width: _width * 80,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.white),
                        borderRadius: BorderRadius.circular(10)),
                    child: Center(
                      child: Text(
                        "Create Account",
                        style: GoogleFonts.mulish(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w700),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: _height * 5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Icon(
                      FontAwesomeIcons.facebookSquare,
                      color: Colors.white,
                      size: 35,
                    ),
                    // Icon(
                    //   FontAwesomeIcons.apple,
                    //   color: Colors.white,
                    //   size: 35,
                    // ),
                    SizedBox(width: _width * 12),
                    Image.asset(
                      "assets/images/iphone.png",
                      height: 35,
                      width: 35,
                      fit: BoxFit.contain,
                    ),
                    SizedBox(width: _width * 12),
                    const Icon(
                      FontAwesomeIcons.google,
                      color: Colors.white,
                      size: 35,
                    ),
                  ],
                ),
                SizedBox(
                  height: _height * 2,
                ),
                Text(
                  "Sign in with another account?",
                  style: GoogleFonts.mulish(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w500),
                ),
              ],
            ),
          )),
    );
  }
}
