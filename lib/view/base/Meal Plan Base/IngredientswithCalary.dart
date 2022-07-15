// ignore_for_file: sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:levelup/util/color.dart';
import 'package:levelup/util/images.dart';

final kInnerDecoration = BoxDecoration(
  color: Colors.white,
  border: Border.all(color: Colors.white),
  borderRadius: BorderRadius.circular(10),
);
// border for all 3 colors
final kGradientBoxDecoration = BoxDecoration(
  gradient: LinearGradient(
      colors: [primary, white],
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter),
  borderRadius: BorderRadius.circular(32),
);

class IngredientwithCalary extends StatelessWidget {
  double? height;
  double? width;
  String heading;
  bool isSelected;
  String subheading;
  bool? isRecipe;
  Function() onTap;

  IngredientwithCalary({
    Key? key,
    this.height,
    this.width,
    required this.isSelected,
    required this.heading,
    required this.subheading,
    this.isRecipe,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width * 0.01;
    double _height = MediaQuery.of(context).size.height * 0.01;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width ?? _width * 90,
        height: height ?? _height * 16,
        margin: EdgeInsets.only(bottom: _height * 2.5, right: 0),
        padding: EdgeInsets.fromLTRB(
            _width * 5, _height * 2.5, _width * 5, _height * 2.5),
        decoration: BoxDecoration(
          color: isSelected ? white : transperant,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: white),
        ),
        child: Row(
          //mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            isRecipe ?? false
                ? ClipOval(
                    clipBehavior: Clip.antiAlias,
                    child: Container(
                      child: Padding(
                        padding: EdgeInsets.all(5), //width of the border
                        child: ClipOval(
                          clipBehavior: Clip.antiAlias,
                          child: Container(
                            width: _width *
                                14, // this width forces the container to be a circle
                            height: _height *
                                7, // this height forces the container to be a circle
                            child: Image.asset(juice),
                            decoration: kInnerDecoration,
                          ),
                        ),
                      ),
                      decoration: kGradientBoxDecoration,
                    ),
                  )
                : Container(
                    height: _height * 8,
                    width: _width * 16,
                    decoration: BoxDecoration(
                      color: white,
                      image: DecorationImage(
                        image: ExactAssetImage(logo),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(50.0)),
                      border: Border.all(
                        color: pgreen,
                        width: 5.0,
                      ),
                    ),
                  ),
            SizedBox(
              width: _width * 5,
            ),
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RichText(
                    text: TextSpan(
                      text: '${heading}\n',
                      style: GoogleFonts.mulish(
                          color: isSelected ? black : white,
                          fontSize: 16,
                          fontWeight: FontWeight.w800),
                      children: <TextSpan>[
                        TextSpan(
                          text: subheading,
                          style: GoogleFonts.mulish(
                              color: isSelected ? black : white,
                              fontSize: 13,
                              fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: _height * 1.5,
                  ),
                  RichText(
                    text: TextSpan(
                      text: '10 ',
                      style: GoogleFonts.mulish(
                          color: isSelected ? black : white,
                          fontSize: 13,
                          fontWeight: FontWeight.w800),
                      children: <TextSpan>[
                        TextSpan(
                          text: "cal/oz   ",
                          style: GoogleFonts.mulish(
                              color: isSelected ? black : white,
                              fontSize: 13,
                              fontWeight: FontWeight.w700),
                        ),
                        TextSpan(
                          text: "37% ",
                          style: GoogleFonts.mulish(
                              color: primary,
                              fontSize: 13,
                              fontWeight: FontWeight.w700),
                        ),
                        TextSpan(
                          text: "P   ",
                          style: GoogleFonts.mulish(
                              color: isSelected ? black : white,
                              fontSize: 13,
                              fontWeight: FontWeight.w700),
                        ),
                        TextSpan(
                          text: "65% ",
                          style: GoogleFonts.mulish(
                              color: pgreen,
                              fontSize: 13,
                              fontWeight: FontWeight.w700),
                        ),
                        TextSpan(
                          text: "C   ",
                          style: GoogleFonts.mulish(
                              color: isSelected ? black : white,
                              fontSize: 13,
                              fontWeight: FontWeight.w700),
                        ),
                        TextSpan(
                          text: "5% ",
                          style: GoogleFonts.mulish(
                              color: pyellow,
                              fontSize: 13,
                              fontWeight: FontWeight.w700),
                        ),
                        TextSpan(
                          text: "F",
                          style: GoogleFonts.mulish(
                              color: isSelected ? black : white,
                              fontSize: 13,
                              fontWeight: FontWeight.w700),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
