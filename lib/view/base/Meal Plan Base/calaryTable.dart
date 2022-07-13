import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:levelup/util/color.dart';
import 'package:levelup/util/decoration.dart';

class CalaryTable extends StatelessWidget {
  const CalaryTable({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width * 0.01;
    double _height = MediaQuery.of(context).size.height * 0.01;

    return Container(
        width: _width * 90,
        padding: EdgeInsets.fromLTRB(
            _width * 2.5, _height * 2.5, _width * 2.5, _height * 2.5),
        decoration: BoxDecoration(
            color: transperant,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: white)),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: _width * 20,
                ),
                Container(
                  width: _width * 16,
                  child: Text(
                    "Cal",
                    style: mulish14500,
                  ),
                ),
                Container(
                  width: _width * 16,
                  child: Text(
                    "Protein",
                    style: mulish14500,
                  ),
                ),
                Container(
                  width: _width * 16,
                  child: Text(
                    "Carbs",
                    style: mulish14500,
                  ),
                ),
                Container(
                  width: _width * 16,
                  child: Text(
                    "Fat",
                    style: mulish14500,
                  ),
                )
              ],
            ),
            Divider(
              height: 30,
              color: grey,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: _width * 20,
                  child: Text(
                    "Actual",
                    style: mulish14800,
                  ),
                ),
                Container(
                  width: _width * 16,
                  child: Text(
                    "1810",
                    style: mulish14600,
                  ),
                ),
                Container(
                  width: _width * 16,
                  child: Text(
                    "24%",
                    style: GoogleFonts.mulish(
                      color: primary,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Container(
                  width: _width * 16,
                  child: Text(
                    "62%",
                    style: GoogleFonts.mulish(
                      color: pgreen,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Container(
                  width: _width * 16,
                  child: Text(
                    "14%",
                    style: GoogleFonts.mulish(
                      color: pyellow,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: _width * 20,
                  child: Text(
                    "Target",
                    style: mulish14800,
                  ),
                ),
                Container(
                  width: _width * 16,
                  child: Text(
                    "1798",
                    style: mulish14600,
                  ),
                ),
                Container(
                  width: _width * 16,
                  child: Text(
                    "25",
                    style: GoogleFonts.mulish(
                      color: primary,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Container(
                  width: _width * 16,
                  child: Text(
                    "60%",
                    style: GoogleFonts.mulish(
                      color: pgreen,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Container(
                  width: _width * 16,
                  child: Text(
                    "14%",
                    style: GoogleFonts.mulish(
                      color: pyellow,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                )
              ],
            ),
            Divider(
              height: 30,
              color: grey,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: _width * 20,
                  alignment: Alignment.center,
                  child: Text(
                    "+/-",
                    style: mulish14800,
                  ),
                ),
                Container(
                  width: _width * 16,
                  child: Text(
                    "12",
                    style: mulish14600,
                  ),
                ),
                Container(
                  width: _width * 16,
                  child: Text(
                    "-1%",
                    style: GoogleFonts.mulish(
                      color: primary,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Container(
                  width: _width * 16,
                  child: Text(
                    "2%",
                    style: GoogleFonts.mulish(
                      color: pgreen,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Container(
                  width: _width * 16,
                  child: Text(
                    "0%",
                    style: GoogleFonts.mulish(
                      color: pyellow,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                )
              ],
            ),
          ],
        ));
  }
}
