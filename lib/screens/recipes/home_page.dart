import 'package:flutter/material.dart';
import 'package:kitchenwise/constants.dart';
import 'package:kitchenwise/data/recipe_data.dart';
import 'package:kitchenwise/models/recipe_model.dart';
import 'package:kitchenwise/widgets/recipe_widgets/recipe_grid.dart';

enum RecipeHeader { suggestedRecipes, myRecipes }

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  RecipeHeader selectedHeader = RecipeHeader.suggestedRecipes;
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    for (Recipe recipe in recipeData.recipeList) {
      recipe.setImageUrl();
    }
  }

  @override
  void dispose() {
    super.dispose();
    searchController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: AppConstants.sidePadding),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextButton(
                          child: Text(
                            'Suggested Recipes',
                            style:
                                selectedHeader == RecipeHeader.suggestedRecipes
                                    ? Theme.of(context)
                                        .textTheme
                                        .labelLarge
                                        ?.copyWith(
                                          fontWeight: FontWeight.w900,
                                          color: Theme.of(context)
                                              .colorScheme
                                              .secondary,
                                        )
                                    : Theme.of(context).textTheme.labelLarge,
                          ),
                          onPressed: () {
                            setState(() {
                              selectedHeader = RecipeHeader.suggestedRecipes;
                            });
                          },
                        ),
                        TextButton(
                          child: Text(
                            'My Recipes',
                            style: selectedHeader == RecipeHeader.myRecipes
                                ? Theme.of(context)
                                    .textTheme
                                    .labelLarge
                                    ?.copyWith(
                                      fontWeight: FontWeight.w900,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .secondary,
                                    )
                                : Theme.of(context).textTheme.labelLarge,
                          ),
                          onPressed: () {
                            setState(() {
                              selectedHeader = RecipeHeader.myRecipes;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(
                          top: AppConstants.headerPadding),
                      child: RecipeGrid(searchController: searchController),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
