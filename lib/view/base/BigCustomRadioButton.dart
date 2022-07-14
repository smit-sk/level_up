// ignore_for_file: sort_child_properties_last
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:levelup/util/color.dart';

class BigCustomRadioBUtton extends StatefulWidget {
  BigCustomRadioBUtton(
      {Key? key,
      required this.height,
      required this.width,
      required this.isSelectedLeftText,
      required this.isSelectedRightText,
      required this.LeftText,
      required this.RightText,
      required this.onTap})
      : super(key: key);

  final double height;
  final double width;
  final bool isSelectedLeftText;
  final bool isSelectedRightText;
  final String LeftText;
  final String RightText;
  final Function() onTap;
  @override
  State<BigCustomRadioBUtton> createState() => _BigCustomRadioBUttonState();
}

class _BigCustomRadioBUttonState extends State<BigCustomRadioBUtton> {
  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width * 0.01;
    double _height = MediaQuery.of(context).size.height * 0.01;
    return Container(
      height: widget.height,
      width: widget.width,
      child: Row(
        children: [
          GestureDetector(
            onTap: widget.onTap,
            child: Container(
              height: widget.height,
              width: (widget.width / 2) - 1,
              child: Center(
                child: Text(
                  widget.LeftText,
                  style: GoogleFonts.mulish(
                      fontSize: 16,
                      color: widget.isSelectedLeftText ? primary : white,
                      fontWeight: FontWeight.w700),
                ),
              ),
              decoration: BoxDecoration(
                color: widget.isSelectedLeftText ? white : transperant,
                borderRadius: BorderRadius.circular(9),
                //border: Border.all(color: lightgrey),
              ),
            ),
          ),
          GestureDetector(
            onTap: widget.onTap,
            child: Container(
              height: widget.height,
              width: (widget.width / 2) - 1,
              child: Center(
                child: Text(
                  widget.RightText,
                  style: GoogleFonts.mulish(
                      fontSize: 16,
                      color: widget.isSelectedRightText ? primary : white,
                      fontWeight: FontWeight.w700),
                ),
              ),
              decoration: BoxDecoration(
                color: widget.isSelectedRightText ? white : transperant,
                borderRadius: BorderRadius.circular(9),
                // border: Border.all(
                //     color: widget.isSelectedMatric ? white : lightgrey),
              ),
            ),
          )
        ],
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: white),
      ),
    );
  }
}
