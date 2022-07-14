// ignore_for_file: depend_on_referenced_packages

import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:levelup/view/screens/Meal%20Plan/CopyDay.dart';

class MealPlanController extends GetxController implements GetxService {
  int _selectedBottomSheetitem = 1;
  bool _toogle = false;
  bool _isRearragePortionLock = false;

  List<CopyDayWeekModel> _copyDayWeekList = [];
  List<CopyDayWeekModel> _clearDayWeekList = [];
  List<String> _weekDayDatelist = [];

  bool get toggle => _toogle;
  bool get isRearrangePortionLock => _isRearragePortionLock;
  int get selectedBottomSheetitem => _selectedBottomSheetitem;
  List get copyDayWeekList => _copyDayWeekList;
  List get clearDayWeekList => _clearDayWeekList;
  List get weekDayDateList => _weekDayDatelist;

  @override
  void onInit() {
    loadWeekData();
  }

  loadWeekData() {
    DateTime d = DateTime.now();
    int weekDay = d.weekday;
    for (int i = 1; i < 8; i++) {
      DateTime firstDayOfWeek = d.subtract(Duration(days: weekDay - i));

      _copyDayWeekList.add(CopyDayWeekModel(
          day: DateFormat('EEEE').format(firstDayOfWeek),
          date: DateFormat('dd MMM yyyy').format(firstDayOfWeek),
          isSelected: false,
          daydate:
              "${DateFormat('EEEE').format(firstDayOfWeek)} | ${DateFormat('dd MMM yyyy').format(firstDayOfWeek)}"));
      _weekDayDatelist.add(
          "${DateFormat('EEEE').format(firstDayOfWeek)} | ${DateFormat('dd MMM yyyy').format(firstDayOfWeek)}");
    }
    print("loaded week data succesfully");
    _clearDayWeekList = _copyDayWeekList;
    update();
  }

  updateSelecteddayofweekCopyDay(value, index) {
    _copyDayWeekList[index].isSelected = value;
    update();
  }

  updateSelecteddayofweekClearDay(value, index) {
    _clearDayWeekList[index].isSelected = value;
    update();
  }

  updateRearrangePortionLock(value) {
    _isRearragePortionLock = value;
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

class CopyDayWeekModel {
  String day;
  String date;
  String daydate;
  bool isSelected;
  CopyDayWeekModel(
      {required this.day,
      required this.date,
      required this.isSelected,
      required this.daydate});
}
