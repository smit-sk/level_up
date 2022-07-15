import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:levelup/util/color.dart';
import 'package:levelup/util/decoration.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class CalaryChartModel {
  CalaryChartModel(this.x, this.y, this.gram, [this.color]);
  final String x;
  final double y;
  final String gram;
  final Color? color;
}

class CalaryChart extends StatelessWidget {
  List<CalaryChartModel> data;

  CalaryChart({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width * 0.01;
    double _height = MediaQuery.of(context).size.height * 0.01;
    return Container(
      height: _height * 18,
      width: _width * 90,
      decoration: BoxDecoration(
        border: Border.all(color: white),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: _width * 35,
            child: SfCircularChart(annotations: <CircularChartAnnotation>[
              CircularChartAnnotation(
                  widget: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "3564",
                      style: GoogleFonts.mulish(
                        color: white,
                        fontSize: 14,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    Text(
                      "Cal",
                      style: GoogleFonts.mulish(
                        color: white,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ))
            ], series: <CircularSeries>[
              DoughnutSeries<CalaryChartModel, String>(
                  dataSource: data,
                  pointColorMapper: (CalaryChartModel data, _) => data.color,
                  xValueMapper: (CalaryChartModel data, _) => data.x,
                  yValueMapper: (CalaryChartModel data, _) => data.y,
                  cornerStyle: CornerStyle.bothCurve,
                  innerRadius: '80%',
                  radius: '85%'),
            ]),
          ),
          Container(
            padding: EdgeInsets.only(top: _height * 3),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "${data[0].y} %",
                  style: GoogleFonts.mulish(
                      color: primary,
                      fontSize: 14,
                      fontWeight: FontWeight.w700),
                ),
                SizedBox(
                  height: _height * 2,
                ),
                Text(
                  "${data[0].gram}",
                  style: mulish14800,
                ),
                SizedBox(
                  height: _height * 2,
                ),
                Text(
                  "${data[0].x}",
                  style: mulish14500,
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: _height * 3),
            child: Column(
              children: [
                Text(
                  "${data[1].y}%",
                  style: GoogleFonts.mulish(
                      color: pgreen, fontSize: 14, fontWeight: FontWeight.w700),
                ),
                SizedBox(
                  height: _height * 2,
                ),
                Text(
                  "${data[1].gram}",
                  style: mulish14800,
                ),
                SizedBox(
                  height: _height * 2,
                ),
                Text(
                  "${data[1].x}",
                  style: mulish14500,
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: _height * 3),
            child: Column(
              children: [
                Text(
                  "${data[2].y}%",
                  style: GoogleFonts.mulish(
                      color: pyellow,
                      fontSize: 14,
                      fontWeight: FontWeight.w700),
                ),
                SizedBox(
                  height: _height * 2,
                ),
                Text(
                  "${data[2].gram}",
                  style: mulish14800,
                ),
                SizedBox(
                  height: _height * 2,
                ),
                Text(
                  "${data[2].x}",
                  style: mulish14500,
                ),
              ],
            ),
          ),
          SizedBox(
            width: 10,
          ),
        ],
      ),
    );
  }
}
