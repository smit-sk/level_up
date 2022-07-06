// ignore_for_file: sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:levelup/util/color.dart';

class CustomContainerTwotext extends StatelessWidget {
  const CustomContainerTwotext(
      {Key? key, required this.leftText, required this.rightText})
      : super(key: key);

  final String leftText;
  final String rightText;

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width * 0.01;
    double _height = MediaQuery.of(context).size.height * 0.01;
    return Container(
      height: _height * 7.5,
      padding: EdgeInsets.symmetric(
        horizontal: _width * 4,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            child: Text(
              leftText,
              style: GoogleFonts.mulish(
                  color: grey, fontSize: 14, fontWeight: FontWeight.w500),
            ),
          ),
          Text(
            rightText,
            style: GoogleFonts.mulish(
                color: white, fontSize: 16, fontWeight: FontWeight.w800),
          ),
        ],
      ),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: white,
          )),
    );
  }
}
