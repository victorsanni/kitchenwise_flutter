import 'package:flutter/material.dart';
import 'package:kitchenwise/data/recipe_data.dart';

import 'recipe_model.dart';

class RecipeList extends ChangeNotifier {
  RecipeList({required this.recipeList, required this.rsum});

  List<Recipe> recipeList;
  int rsum;

  factory RecipeList.fromList(List<Recipe> dataList) {
    int id = 0;
    List<Recipe> newList = [];
    for (Recipe recipe in dataList) {
      recipe.id = id;
      recipe.setImageUrl();
      newList.add(recipe);
      id += 1;
    }
    return RecipeList(recipeList: newList, rsum: newList.length);
  }

  int get length => recipeList.length;

  void add(Recipe recipe) {
    recipe.id = rsum;
    recipe.setImageUrl();
    recipe.isMine = false;
    recipeList.add(recipe);
    rsum += 1;
    notifyListeners();
  }

  void remove(Recipe recipe) {
    recipeList.removeWhere((item) => item.id == recipe.id);
    notifyListeners();
  }

  Recipe getById(int id) {
    return recipeList.firstWhere((item) => item.id == id);
  }

  void makeMineById(int id) {
    int index =
        recipeList.indexOf(recipeList.firstWhere((item) => item.id == id));
    recipeList[index].isMine = true;
    notifyListeners();
  }

  void makeNotMineById(int id) {
    int index =
        recipeList.indexOf(recipeList.firstWhere((item) => item.id == id));
    recipeList[index].isMine = false;
    notifyListeners();
  }

  RecipeList duplicate() {
    RecipeList dupList = RecipeList.fromList(recipeList);
    return dupList;
  }

  void search(String text) {
    if (text.isNotEmpty) {
      recipeList = recipeList
          .where(
              (test) => test.title.toLowerCase().contains(text.toLowerCase()))
          .toList();
      notifyListeners();
    } else {
      recipeList = recipeData.recipeList;
      notifyListeners();
    }
  }

  void showMyRecipes() {
    recipeList = recipeList.where((recipe) => recipe.isMine).toList();
    notifyListeners();
  }
}
