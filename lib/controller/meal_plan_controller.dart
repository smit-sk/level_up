// ignore_for_file: depend_on_referenced_packages

import 'package:get/get.dart';
import 'package:intl/intl.dart';

class MealPlanController extends GetxController implements GetxService {
  int _selectedBottomSheetitem = 1;
  bool _toogle = false;

  List<String> _weekDatelist = [];
  List<String> _weekDaylist = [];
  List<String> _weekDayDatelist = [];
  List<bool> _selecteddaylist = [];

  bool get toggle => _toogle;

  int get selectedBottomSheetitem => _selectedBottomSheetitem;
  List get weekDateList => _weekDatelist;
  List get weekDayList => _weekDaylist;
  List get weekDayDateList => _weekDayDatelist;
  List get selectedDayList => _selecteddaylist;

  @override
  void onInit() {
    loadWeekData();
  }

  loadWeekData() {
    DateTime d = DateTime.now();
    int weekDay = d.weekday;
    for (int i = 1; i < 8; i++) {
      DateTime firstDayOfWeek = d.subtract(Duration(days: weekDay - i));
      _weekDaylist.add(DateFormat('EEEE').format(firstDayOfWeek));
      _weekDatelist.add(DateFormat('dd MMM yyyy').format(firstDayOfWeek));
      _selecteddaylist.add(false);
      _weekDayDatelist.add(
          "${DateFormat('EEEE').format(firstDayOfWeek)} | ${DateFormat('dd MMM yyyy').format(firstDayOfWeek)}");
    }
    print("loaded week data succesfully");
    update();
  }

  updateSelecteddayofweek(value, index) {
    _selecteddaylist[index] = value;
    update();
  }

  updateselectedMealPlanBSitem(value) {
    _selectedBottomSheetitem = value;
    update();
  }

  updatetoggle(value) {
    _toogle = value;
    update();
  }
}
