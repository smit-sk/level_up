// ignore_for_file: sort_child_properties_last
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:levelup/util/color.dart';

class BigCustomRadioBUtton extends StatefulWidget {
  const BigCustomRadioBUtton(
      {Key? key,
      required this.height,
      required this.width,
      required this.isSelectedUSstandard,
      required this.isSelectedMatric,
      required this.onTap})
      : super(key: key);

  final double height;
  final double width;
  final bool isSelectedUSstandard;
  final bool isSelectedMatric;
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
                  "U.S.Standard",
                  style: GoogleFonts.mulish(
                      fontSize: 16,
                      color: widget.isSelectedUSstandard ? primary : white,
                      fontWeight: FontWeight.w700),
                ),
              ),
              decoration: BoxDecoration(
                color: widget.isSelectedUSstandard ? white : transperant,
                borderRadius: BorderRadius.circular(10),
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
                  "Metric",
                  style: GoogleFonts.mulish(
                      fontSize: 16,
                      color: widget.isSelectedMatric ? primary : white,
                      fontWeight: FontWeight.w700),
                ),
              ),
              decoration: BoxDecoration(
                color: widget.isSelectedMatric ? white : transperant,
                borderRadius: BorderRadius.circular(10),
                // border: Border.all(
                //     color: widget.isSelectedMatric ? white : lightgrey),
              ),
            ),
          )
        ],
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: lightgrey),
      ),
    );
  }
}
