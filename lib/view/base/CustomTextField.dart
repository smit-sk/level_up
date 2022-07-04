import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:levelup/util/color.dart';

class CustomTextFeild extends StatefulWidget {
  const CustomTextFeild({
    Key? key,
    required this.height,
    required this.width,
    required this.lableText,
    required this.onChanged,
    required this.validator,
    required this.isObscureText,
  }) : super(key: key);

  final double height;
  final double width;
  final String lableText;
  final String? Function(String value) onChanged;
  final String Function(String? value)? validator;
  final bool isObscureText;

  @override
  State<CustomTextFeild> createState() => _CustomTextFeildState();
}

class _CustomTextFeildState extends State<CustomTextFeild> {
  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width * 0.01;
    double _height = MediaQuery.of(context).size.height * 0.01;
    return Container(
      width: _width * 80,
      height: _height * 7,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: grey)),
      child: TextFormField(
        cursorColor: white,
        textAlign: TextAlign.start,
        style: GoogleFonts.mulish(
            fontSize: 16, color: white, fontWeight: FontWeight.w700),
        obscureText: widget.isObscureText,
        obscuringCharacter: "*",
        validator: widget.validator,
        onChanged: widget.onChanged,
        decoration: InputDecoration(
          labelText: widget.lableText,
          labelStyle: GoogleFonts.poppins(
              color: grey, fontSize: 16, fontWeight: FontWeight.normal),
          fillColor: Colors.transparent,
          isDense: true,
          contentPadding: EdgeInsets.all(10),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: grey),
            borderRadius: BorderRadius.circular(6),
          ),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: grey),
            borderRadius: BorderRadius.circular(6),
          ),
        ),
      ),
    );
  }
}