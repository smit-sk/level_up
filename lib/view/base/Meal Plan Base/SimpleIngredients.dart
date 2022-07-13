import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:levelup/util/color.dart';

class SimpleIngredients extends StatefulWidget {
  String imagepath;
  String mainIngredients;
  String subIngredients;
  bool isSelected;
  Function() onTap;

  SimpleIngredients({
    Key? key,
    required this.imagepath,
    required this.mainIngredients,
    required this.subIngredients,
    required this.isSelected,
    required this.onTap,
  }) : super(key: key);

  @override
  State<SimpleIngredients> createState() => _SimpleIngredientsState();
}

class _SimpleIngredientsState extends State<SimpleIngredients> {
  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width * 0.01;
    double _height = MediaQuery.of(context).size.height * 0.01;
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        width: _width * 90,
        margin: EdgeInsets.only(bottom: _height * 2.5, right: 0),
        padding: EdgeInsets.fromLTRB(
            _width * 7, _height * 2.5, _width * 5, _height * 2.5),
        decoration: BoxDecoration(
          color: widget.isSelected ? white : transperant,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: white),
        ),
        child: Row(
          //mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: _height * 8,
              width: _width * 16,
              decoration: BoxDecoration(
                color: white,
                image: DecorationImage(
                  image: ExactAssetImage(widget.imagepath),
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
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RichText(
                  text: TextSpan(
                    text: '${widget.mainIngredients}\n',
                    style: GoogleFonts.mulish(
                        color: widget.isSelected ? black : white,
                        fontSize: 16,
                        fontWeight: FontWeight.w800),
                    children: <TextSpan>[
                      TextSpan(
                        text: widget.subIngredients,
                        style: GoogleFonts.mulish(
                            color: widget.isSelected ? black : white,
                            fontSize: 13,
                            fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
