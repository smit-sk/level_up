// ignore_for_file: prefer_final_fields

import 'package:get/get.dart';

class AddFoodRecipeController extends GetxController implements GetxService {
  List<IngredientsModel> _allIngredientsList = [
    IngredientsModel(
        mainIngredients: "Almond Milk",
        subIngredientsName: "choco",
        isSelected: false),
    IngredientsModel(
        mainIngredients: "Apple", subIngredientsName: "red", isSelected: false),
    IngredientsModel(
        mainIngredients: "Cheese",
        subIngredientsName: "Feta,Whole milk,Crumbled",
        isSelected: false),
    IngredientsModel(
        mainIngredients: "Apple juice",
        subIngredientsName:
            "With added vitamin C, from concentrate, shelf stable",
        isSelected: false),
    IngredientsModel(
        mainIngredients: "Almond Milk",
        subIngredientsName: "choco",
        isSelected: false),
    IngredientsModel(
        mainIngredients: "Apples",
        subIngredientsName: "Fuji with skin row",
        isSelected: false)
  ];

  List<IngredientsModel> _selectedInIngredientsList = [];
  List<IngredientsModel> _editItemIngredientsList = [];

  List<IngredientsModel> _searchResultIngredientsList = [
    IngredientsModel(
        mainIngredients: "Almond Milk",
        subIngredientsName: "choco",
        isSelected: false),
    IngredientsModel(
        mainIngredients: "Apple", subIngredientsName: "red", isSelected: false),
    IngredientsModel(
        mainIngredients: "Cheese",
        subIngredientsName: "Feta,Whole milk,Crumbled",
        isSelected: false),
    IngredientsModel(
        mainIngredients: "Apple juice",
        subIngredientsName:
            "With added vitamin C, from concentrate, shelf stable",
        isSelected: false),
    IngredientsModel(
        mainIngredients: "Almond Milk",
        subIngredientsName: "choco",
        isSelected: false),
    IngredientsModel(
        mainIngredients: "Apples",
        subIngredientsName: "Fuji with skin row",
        isSelected: false)
  ];

  bool _isFoods = true;
  bool _isRecipe = false;

  List get allIngredientsList => _allIngredientsList;
  List get searchResultIngredientsList => _searchResultIngredientsList;
  List get selectedIngredientsList => _selectedInIngredientsList;
  List get editItemIngredientsList => _editItemIngredientsList;
  bool get isFood => _isFoods;
  bool get isRecipe => _isRecipe;

  onItemChangedIngredientsList(String value) {
    if (value.isNotEmpty) {
      _searchResultIngredientsList = _allIngredientsList
          .where((Ig) =>
              Ig.mainIngredients.toLowerCase().contains(value.toLowerCase()))
          .toList();
    } else {
      _searchResultIngredientsList = _allIngredientsList;
    }
    update();
  }

  changeFoodsRecipe() {
    _isFoods = !_isFoods;
    _isRecipe = !isRecipe;
    update();
  }

  selectIngredients(index) {
    _searchResultIngredientsList[index].isSelected =
        !_searchResultIngredientsList[index].isSelected;
    if (_searchResultIngredientsList[index].isSelected) {
      _selectedInIngredientsList.add(_searchResultIngredientsList[index]);
    } else {
      if (_selectedInIngredientsList.isNotEmpty)
        _selectedInIngredientsList.remove(_searchResultIngredientsList[index]);
    }
    update();
    print(_selectedInIngredientsList);
  }

  addselectedListInEditItemlist() {
    _editItemIngredientsList = _selectedInIngredientsList;
    update();
    
  }
}

class IngredientsModel {
  String mainIngredients;
  String subIngredientsName;
  bool isSelected;

  IngredientsModel(
      {required this.mainIngredients,
      required this.subIngredientsName,
      required this.isSelected});
}
