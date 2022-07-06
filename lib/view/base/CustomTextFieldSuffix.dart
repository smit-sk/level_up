import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:levelup/util/color.dart';

class CustormTextFieldSuffix extends StatefulWidget {
  CustormTextFieldSuffix({
    Key? key,
    required this.height,
    required this.widthContainer,
    required this.widthTextField,
    required this.onChanged,
    required this.suffixText,
  }) : super(
          key: key,
        );

  double height;
  double widthContainer;
  double widthTextField;
  String Function(String value) onChanged;
  String suffixText;

  @override
  State<CustormTextFieldSuffix> createState() => _CustormTextFieldSuffixState();
}

class _CustormTextFieldSuffixState extends State<CustormTextFieldSuffix> {
  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width * 0.01;
    double _height = MediaQuery.of(context).size.height * 0.01;
    return Container(
      width: widget.widthContainer,
      height: widget.height,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: white)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
            width: widget.widthTextField,
            child: TextFormField(
              cursorColor: white,
              textAlign: TextAlign.start,
              style: GoogleFonts.mulish(
                  fontSize: 16, color: white, fontWeight: FontWeight.w700),
              onChanged: widget.onChanged,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(vertical: 10),
                fillColor: Colors.transparent,
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: transperant),
                  borderRadius: BorderRadius.circular(6),
                ),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: transperant),
                  borderRadius: BorderRadius.circular(6),
                ),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(right: 15),
            child: Text(widget.suffixText,
                style: GoogleFonts.mulish(
                    fontSize: 18, fontWeight: FontWeight.w700, color: white)),
          ),
        ],
      ),
    );
  }
}
