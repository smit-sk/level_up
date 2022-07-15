// ignore_for_file: prefer_final_fields, curly_braces_in_flow_control_structures

import 'package:get/get.dart';
import 'package:levelup/controller/copy_clear_day_MP_controller.dart';
import 'package:levelup/controller/meal_plan_controller.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class AddFoodRecipeController extends GetxController implements GetxService {
  List<FoodsModel> _allFoodsList = [
    FoodsModel(
        mainFoods: "Almond Milk", subFoodsName: "choco", isSelected: false),
    FoodsModel(mainFoods: "Apple", subFoodsName: "red", isSelected: false),
    FoodsModel(
        mainFoods: "Cheese",
        subFoodsName: "Feta,Whole milk,Crumbled",
        isSelected: false),
    FoodsModel(
        mainFoods: "Apple juice",
        subFoodsName: "With added vitamin C, from concentrate, shelf stable",
        isSelected: false),
    FoodsModel(
        mainFoods: "Almond Milk", subFoodsName: "choco", isSelected: false),
    FoodsModel(
        mainFoods: "Apples",
        subFoodsName: "Fuji with skin row",
        isSelected: false)
  ];
  List<FoodsModel> _selectedInFoodsList = [];
  List<FoodsModel> _editItemFoodsList = [];
  List<FoodsModel> _searchResultFoodsList = [
    FoodsModel(
        mainFoods: "Almond Milk", subFoodsName: "choco", isSelected: false),
    FoodsModel(mainFoods: "Apple", subFoodsName: "red", isSelected: false),
    FoodsModel(
        mainFoods: "Cheese",
        subFoodsName: "Feta,Whole milk,Crumbled",
        isSelected: false),
    FoodsModel(
        mainFoods: "Apple juice",
        subFoodsName: "With added vitamin C, from concentrate, shelf stable",
        isSelected: false),
    FoodsModel(
        mainFoods: "Almond Milk", subFoodsName: "choco", isSelected: false),
    FoodsModel(
        mainFoods: "Apples",
        subFoodsName: "Fuji with skin row",
        isSelected: false)
  ];
  List<MealTypeModel> _filterList = [
    MealTypeModel(mealName: "Breakfast", isSelected: false),
    MealTypeModel(mealName: "Lunch", isSelected: false),
    MealTypeModel(mealName: "Dinner", isSelected: false),
    MealTypeModel(mealName: "Snack", isSelected: false),
  ];
  int _filterBadge = 0;

  List _weekDayDateList = Get.find<CopyClearDayMealPlanController>().weekDayDateList;
  String _selectedDayDate = Get.find<CopyClearDayMealPlanController>().weekDayDateList[0];

  List<MealTypeModel> _mealTypeList = [
    MealTypeModel(mealName: "Breakfast", isSelected: false),
    MealTypeModel(mealName: "Luch", isSelected: false),
    MealTypeModel(mealName: "Dinner", isSelected: false),
    MealTypeModel(mealName: "Snack", isSelected: false)
  ];

  bool _isFoods = true;
  bool _isRecipe = false;

  List get allFoodsList => _allFoodsList;
  List get searchResultFoodsList => _searchResultFoodsList;
  List get selectedFoodsList => _selectedInFoodsList;
  List get editItemFoodsList => _editItemFoodsList;
  List get weekDayDateList => _weekDayDateList;
  String get selectedDayDate => _selectedDayDate;
  List get filterlist => _filterList;
  int get filterBadge => _filterBadge;

  List get mealTypeList => _mealTypeList;
  bool get isFood => _isFoods;
  bool get isRecipe => _isRecipe;

  onItemChangedFoodsList(String value) {
    if (value.isNotEmpty) {
      _searchResultFoodsList = _allFoodsList
          .where(
              (Ig) => Ig.mainFoods.toLowerCase().contains(value.toLowerCase()))
          .toList();
    } else {
      _searchResultFoodsList = _allFoodsList;
    }
    update();
  }

  changeFoodsRecipe() {
    _isFoods = !_isFoods;
    _isRecipe = !isRecipe;
    update();
  }

  changeFilterList(bool isClearAll, [index]) {
    if (!isClearAll) {
      _filterList[index].isSelected = !_filterList[index].isSelected;
      update();
    } else {
      for (int i = 0; i < _filterList.length; i++) {
        _filterList[i].isSelected = false;
      }
      update();
    }
  }

  countFilterNumber() {
    int selectedNotification = 0;
    for (int i = 0; i < _filterList.length; i++) {
      if (_filterList[i].isSelected) {
        selectedNotification++;
      }
    }
    _filterBadge = selectedNotification;
    update();
  }

  selectFoods(index) {
    _searchResultFoodsList[index].isSelected =
        !_searchResultFoodsList[index].isSelected;
    if (_searchResultFoodsList[index].isSelected) {
      _selectedInFoodsList.add(_searchResultFoodsList[index]);
    } else {
      if (_selectedInFoodsList.isNotEmpty)
        _selectedInFoodsList.remove(_searchResultFoodsList[index]);
    }
    update();
    print(_selectedInFoodsList);
  }

  addselectedListInEditItemlist() {
    _editItemFoodsList = _selectedInFoodsList;
    if (_selectedInFoodsList.isNotEmpty) {
      for (int i = 0; i < _selectedInFoodsList.length; i++) {
        _selectedInFoodsList[i].isSelected = i == 0 ? true : false;
      }
    }
    update();
  }

  selectAnyOneFoods(index) {
    if (_selectedInFoodsList.isNotEmpty) {
      for (int i = 0; i < _selectedInFoodsList.length; i++) {
        _selectedInFoodsList[i].isSelected = i == index ? true : false;
      }
    }

    update();
  }

  changeMealType(index, value) {
    _mealTypeList[index].isSelected = !_mealTypeList[index].isSelected;
    update();
  }

  changeDayDate(value) {
    _selectedDayDate = value;
    update();
  }
}

class FoodsModel {
  String mainFoods;
  String subFoodsName;
  bool isSelected;

  FoodsModel(
      {required this.mainFoods,
      required this.subFoodsName,
      required this.isSelected});
}

class MealTypeModel {
  String mealName;
  bool isSelected;

  MealTypeModel({required this.mealName, required this.isSelected});
}
