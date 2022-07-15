import 'package:get/get.dart';
import 'package:levelup/controller/meal_plan_controller.dart';
import 'package:intl/intl.dart';

class CopyClearDayMealPlanController extends GetxController
    implements GetxService {
  List<WeekDataModel> _copyDayWeekList = [];
  List<WeekDataModel> _clearDayWeekList = [];
  List<String> _weekDayDatelist = [];

  List<WeekDataModel> get copyDayWeekList => _copyDayWeekList;
  List<WeekDataModel> get clearDayWeekList => _clearDayWeekList;
  List get weekDayDateList => _weekDayDatelist;

  String _selctedDateCOPY = "";
  String get selctedDateCOPY => _selctedDateCOPY;

  int _totalCopyDay = 0;
  int get totalCopyDay => _totalCopyDay;

  int _totalClearDay = 0;
  int get totalClearDay => _totalClearDay;

  @override
  void onInit() {
    loadWeekData();
  }

  loadWeekData() {
    DateTime d = DateTime.now();
    int weekDay = d.weekday;
    for (int i = 1; i < 8; i++) {
      DateTime firstDayOfWeek = d.subtract(Duration(days: weekDay - i));

      _copyDayWeekList.add(WeekDataModel(
          day: DateFormat('EEEE').format(firstDayOfWeek),
          date: DateFormat('dd MMM yyyy').format(firstDayOfWeek),
          isSelected: false,
          daydate:
              "${DateFormat('EEEE').format(firstDayOfWeek)} | ${DateFormat('dd MMM yyyy').format(firstDayOfWeek)}"));
      _weekDayDatelist.add(
          "${DateFormat('EEEE').format(firstDayOfWeek)} | ${DateFormat('dd MMM yyyy').format(firstDayOfWeek)}");
    }
    print("loaded week data succesfully");
    _selctedDateCOPY = _weekDayDatelist[0];
    _clearDayWeekList = _copyDayWeekList;
    update();
  }

  changeDateCOPY(String dayDate) {
    _selctedDateCOPY = dayDate;
    update();
  }

  updateSelecteddayofweekCopyDay(value, index) {
    _copyDayWeekList[index].isSelected = value;
    _totalCopyDay = value ? _totalCopyDay + 1 : _totalCopyDay - 1;
    update();
  }

  updateSelecteddayofweekClearDay(value, index) {
    _clearDayWeekList[index].isSelected = value;
    _totalClearDay = value ? _totalClearDay + 1 : _totalClearDay - 1;
    print("Total Clear Day $_totalClearDay");
    update();
  }
}

class WeekDataModel {
  String day;
  String date;
  String daydate;
  bool isSelected;
  WeekDataModel(
      {required this.day,
      required this.date,
      required this.isSelected,
      required this.daydate});
}
