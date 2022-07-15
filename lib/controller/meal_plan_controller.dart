// ignore_for_file: depend_on_referenced_packages, prefer_final_fields

import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:levelup/controller/copy_clear_day_MP_controller.dart';
import 'package:levelup/util/color.dart';

import '../view/base/Meal Plan Base/calaryChart.dart';

class MealPlanController extends GetxController implements GetxService {
  int _selectedBottomSheetitemIndex = 5;
  bool _toogle = false;
  bool _isRearragePortionLock = false;
  int _selectedDayIndex = 0;
  List<CalaryChartModel> _chartData = [
    CalaryChartModel('Protein', 35, "135g", primary),
    CalaryChartModel('Carbs', 60, "547g", pgreen),
    CalaryChartModel('Fat', 5, "265g", pyellow),
  ];
  List<WeekDataModel> _weekDayDateList = [];

  bool get toggle => _toogle;
  bool get isRearrangePortionLock => _isRearragePortionLock;
  int get selectedBottomSheetitemIndex => _selectedBottomSheetitemIndex;
  List<WeekDataModel> get weekDayDateList => _weekDayDateList;

  int get selectedDayindex => _selectedDayIndex;
  List<CalaryChartModel> get chartData => _chartData;

  onInit() {
    loadWeekData();
  }

  changeSelectedDate(int index) {
    for (int i = 0; i < _weekDayDateList.length; i++) {
      print("$i ");
      _weekDayDateList[i].isSelected = i == index ? true : false;
    }
    
    // _weekDayDateList[index].isSelected = true;
    update();
  }

  updateRearrangePortionLock(value) {
    _isRearragePortionLock = value;
    update();
  }

  updateselectedMealPlanBSitem(int index) {
    _selectedBottomSheetitemIndex = index;
    update();
  }

  updatetoggle(value) {
    _toogle = value;
    update();
  }

  loadWeekData() {
    DateTime d = DateTime.now();
    int weekDay = d.weekday;
    for (int i = 1; i < 8; i++) {
      DateTime firstDayOfWeek = d.subtract(Duration(days: weekDay - i));

      _weekDayDateList.add(WeekDataModel(
          day: DateFormat('EEEE').format(firstDayOfWeek),
          date: DateFormat('dd MMM yyyy').format(firstDayOfWeek),
          isSelected: false,
          daydate:
              "${DateFormat('EEEE').format(firstDayOfWeek)} | ${DateFormat('dd MMM yyyy').format(firstDayOfWeek)}"));
    }
    print("loaded week data succesfully");

    update();
  }
}
