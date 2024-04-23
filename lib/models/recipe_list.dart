import 'recipe_model.dart';

class RecipeList {
  RecipeList({required this.recipeList, required this.rsum});

  List<Recipe> recipeList;
  int rsum;

  factory RecipeList.fromList(List<Recipe> dataList) {
    int id = 0;
    List<Recipe> newList = [];
    for (Recipe recipe in dataList) {
      recipe.id = id;
      newList.add(recipe);
      id += 1;
    }
    return RecipeList(recipeList: newList, rsum: newList.length);
  }

  int get length => recipeList.length;

  void add(Recipe recipe) {
    recipe.id = rsum;
    recipeList.add(recipe);
    rsum += 1;
  }

  void remove(Recipe recipe) {
    recipeList.removeWhere((item) => item.id == recipe.id);
  }

  Recipe getById(int id) {
    return recipeList.firstWhere((item) => item.id == id);
  }
}
