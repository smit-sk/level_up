// ignore_for_file: sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:levelup/util/color.dart';

class CustomRadioButton extends StatefulWidget {
  const CustomRadioButton(
      {Key? key,
      required this.height,
      required this.width,
      required this.icon,
      required this.text,
      required this.isSelected, 
      required this.onTap})
      : super(key: key);

  final double height;
  final double width;
  final IconData icon;
  final String text;
  final bool isSelected;
  final Function() onTap;
  @override
  State<CustomRadioButton> createState() => _CustomRadioButtonState();
}

class _CustomRadioButtonState extends State<CustomRadioButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        height: widget.height,
        width: widget.width,
        padding: EdgeInsets.symmetric(horizontal: 10),
        alignment: Alignment.center,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              widget.icon,
              color: widget.isSelected ? primary : lightgrey,
              size: 35,
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              widget.text,
              style: GoogleFonts.mulish(
                  fontSize: 16,
                  color: widget.isSelected ? primary : lightgrey,
                  fontWeight: FontWeight.w700),
            )
          ],
        ),
        decoration: BoxDecoration(
          color: widget.isSelected ? white : Colors.transparent,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: widget.isSelected ? white : lightgrey),
        ),
      ),
    );
  }
}
