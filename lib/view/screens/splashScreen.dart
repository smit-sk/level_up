import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:levelup/helper/routeHelper.dart';
import 'package:levelup/util/images.dart';
import 'package:levelup/view/screens/Auth/Sign%20In/SignInCreate.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void initState() {
    Timer(Duration(seconds: 3),
        () => Get.offAllNamed(RouteHelper.getSignInCreateAccountRoute()));
  }

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width * 0.01;
    double _height = MediaQuery.of(context).size.height * 0.01;
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
        fit: BoxFit.cover,
        image: AssetImage(bgimage),
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
              ],
            ),
          )),
    );
  }
}
