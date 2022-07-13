import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:levelup/util/color.dart';

class CustomDropDownMenu extends StatefulWidget {
  final double height;
  final double width;
  final List datalist;
  final String selectedData;
  final void Function(String? value)? onChanged;
  final double dropdownWidth;
  Color? dropdowncolor = transperant;
  CustomDropDownMenu(
      {Key? key,
      required this.height,
      required this.width,
      required this.datalist,
      required this.selectedData,
      required this.dropdownWidth,
      this.dropdowncolor,
      required this.onChanged})
      : super(key: key);

  @override
  State<CustomDropDownMenu> createState() => _CustomDropDownMenuState();
}

class _CustomDropDownMenuState extends State<CustomDropDownMenu> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height,
      width: widget.width,
      child: DropdownButtonHideUnderline(
        child: DropdownButton2(
          isExpanded: true,
          items: widget.datalist
              .map((item) => DropdownMenuItem<String>(
                    value: item,
                    child: Text(
                      item,
                      style: GoogleFonts.mulish(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: white,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ))
              .toList(),
          value: widget.selectedData,
          onChanged: widget.onChanged,
          icon: const Icon(
            Icons.expand_more,
            size: 25,
          ),
          iconSize: 14,
          iconEnabledColor: white,
          iconDisabledColor: Colors.grey,
          buttonPadding: const EdgeInsets.only(left: 14, right: 14),
          buttonDecoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: white,
            ),
          ),
          buttonElevation: 2,
          itemHeight: 40,
          itemPadding: const EdgeInsets.only(left: 14, right: 14),
          dropdownMaxHeight: 200,
          dropdownWidth: widget.dropdownWidth,
          dropdownPadding: null,
          dropdownDecoration: BoxDecoration(
            border: Border.all(color: grey),
            borderRadius: BorderRadius.circular(10),
            color: widget.dropdowncolor ?? transperant,
          ),
          dropdownElevation: 8,
          scrollbarRadius: const Radius.circular(40),
          scrollbarThickness: 6,
          scrollbarAlwaysShow: true,
          offset: const Offset(10, 0),
        ),
      ),
    );
  }
}
