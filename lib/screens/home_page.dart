import 'package:flutter/material.dart';
import 'package:kitchenwise/constants.dart';
import 'package:kitchenwise/data/recipe_data.dart';
import 'package:kitchenwise/widgets/recipe_card.dart';
import 'package:kitchenwise/widgets/text_form_field.dart';

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
  void dispose() {
    super.dispose();
    searchController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.symmetric(
            horizontal: AppConstants.sidePadding,
            vertical: AppConstants.topPadding,
          ),
          child: Column(
            children: [
              Expanded(
                child: Column(
                  children: [
                    Row(
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
                    const SizedBox(height: AppConstants.headerPadding),
                    Row(
                      children: [
                        Expanded(
                          child: CustomTextFormField(
                            hintText: 'Type Something...',
                            autocorrect: true,
                            controller: searchController,
                          ),
                        ),
                        const SizedBox(
                          width: AppConstants.sidePadding,
                        ),
                        IconButton(
                          onPressed: () {
                            // TODO: Filter grid items by searchController text
                          },
                          icon: const Icon(
                            Icons.search,
                            size: AppConstants.appIconSize,
                            weight: AppConstants.buttonBorderThickness,
                          ),
                        ),
                      ],
                    ),
                    Expanded(
                        child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: AppConstants.headerPadding),
                      child: GridView.count(
                        crossAxisCount: 2,
                        mainAxisSpacing: AppConstants.sidePadding,
                        crossAxisSpacing: AppConstants.sidePadding,
                        children: recipeData
                            .map((item) => RecipeCard(
                                  title: item.title,
                                  image: Image.network(
                                    item.imageUrl,
                                    fit: BoxFit.cover,
                                  ),
                                ))
                            .toList(),
                      ),
                    )),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
