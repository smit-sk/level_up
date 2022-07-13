import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:levelup/util/color.dart';

class CustomTextFeild extends StatefulWidget {
  TextEditingController? controller;
  TextInputType? textInputType;
  final double height;
  final double width;
  final String lableText;
  final String? Function(String value) onChanged;
  final bool isObscureText;
  final bool isError;

  CustomTextFeild({
    required this.height,
    required this.width,
    required this.lableText,
    required this.onChanged,
    this.controller,
    this.textInputType,
    required this.isObscureText,
    required this.isError,
  });

  @override
  State<CustomTextFeild> createState() => _CustomTextFeildState();
}

class _CustomTextFeildState extends State<CustomTextFeild> {
  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width * 0.01;
    double _height = MediaQuery.of(context).size.height * 0.01;
    return Container(
      width: widget.width,
      height: widget.height,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: widget.isError ? Colors.red : white)),
      child: TextFormField(
        cursorColor: white,
        controller: widget.controller,
        keyboardType: widget.textInputType,
        textAlign: TextAlign.start,
        style: GoogleFonts.mulish(
            fontSize: 16, color: white, fontWeight: FontWeight.w700),
        obscureText: widget.isObscureText,
        onChanged: widget.onChanged,
        decoration: InputDecoration(
          labelText: widget.lableText,
          labelStyle: GoogleFonts.poppins(
              color: grey, fontSize: 16, fontWeight: FontWeight.normal),
          fillColor: Colors.transparent,
          isDense: true,
          contentPadding: EdgeInsets.fromLTRB(10, 10, 10, 10),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: widget.isError ? Colors.red : grey),
            borderRadius: BorderRadius.circular(6),
          ),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: widget.isError ? Colors.red : grey),
            borderRadius: BorderRadius.circular(6),
          ),
        ),
      ),
    );
  }
}
