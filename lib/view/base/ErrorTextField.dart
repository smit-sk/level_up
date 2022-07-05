import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';

class ErrorTextField extends StatefulWidget {
  const ErrorTextField({Key? key, required this.isError, required this.width , required this.height, required this.errorText}) : super(key: key);

  final bool isError;
  final double width;
  final double height;
  final String errorText;
  @override
  State<ErrorTextField> createState() => _ErrorTextFieldState();
}

class _ErrorTextFieldState extends State<ErrorTextField> {
  @override
  Widget build(BuildContext context) {
    return widget.isError
        ? Container(
            width: widget.width,
            margin: EdgeInsets.only(top: 5),
            child: Align(
              alignment: Alignment.centerLeft,
              child: SizedBox(
                height: widget.height,
                child: Text(
                  widget.errorText,
                  style: GoogleFonts.poppins(color: Colors.red, fontSize: 12),
                ),
              ),
            ),
          )
        : SizedBox(
            height: widget.height,
          );
  }
}
