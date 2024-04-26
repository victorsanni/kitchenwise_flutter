import 'package:flutter/material.dart';
import 'package:kitchenwise/constants.dart';
import 'package:kitchenwise/models/recipe_list.dart';
import 'package:kitchenwise/models/recipe_state.dart';
import 'package:kitchenwise/widgets/custom_text_form_field.dart';
import 'package:kitchenwise/widgets/recipe_widgets/recipe_card.dart';

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
    RecipeList recList = RecipeState.of(context).data;
    RecipeList tempList = recList.duplicate();
    return Scaffold(
      body: SafeArea(
        child: ListenableBuilder(
            listenable: tempList,
            builder: (context, child) {
              return Column(
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
                                  style: selectedHeader ==
                                          RecipeHeader.suggestedRecipes
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
                                    selectedHeader =
                                        RecipeHeader.suggestedRecipes;
                                  });
                                },
                              ),
                              TextButton(
                                child: Text(
                                  'My Recipes',
                                  style: selectedHeader ==
                                          RecipeHeader.myRecipes
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
                                  selectedHeader = RecipeHeader.myRecipes;
                                  tempList.showMyRecipes();
                                },
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(
                                top: AppConstants.headerPadding),
                            child: CustomScrollView(slivers: [
                              SliverAppBar(
                                title: Row(
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
                                          tempList
                                              .search(searchController.text);
                                        },
                                        icon: const Icon(Icons.search,
                                            size: AppConstants.appIconSize))
                                  ],
                                ),
                              ),
                              SliverPadding(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: AppConstants.gridVerticalPadding,
                                    horizontal: AppConstants.sidePadding,
                                  ),
                                  sliver: SliverGrid.builder(
                                    gridDelegate:
                                        SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2,
                                      mainAxisSpacing: AppConstants.sidePadding,
                                      crossAxisSpacing:
                                          AppConstants.sidePadding,
                                      childAspectRatio: MediaQuery.of(context)
                                                  .orientation ==
                                              Orientation.landscape
                                          ? AppConstants.landscapeAspectRatio
                                          : AppConstants.portraitAspectRatio,
                                    ),
                                    itemCount: tempList.recipeList.length,
                                    itemBuilder: (context, index) =>
                                        FutureBuilder<String?>(
                                      future:
                                          tempList.recipeList[index].imageUrl,
                                      builder: (context, snapshot) {
                                        if (snapshot.hasData) {
                                          return RecipeCard(
                                            id: tempList.recipeList[index].id,
                                            title: tempList
                                                .recipeList[index].title,
                                            imageUrl: snapshot.data,
                                            imageHeight:
                                                AppConstants.imageHeight,
                                          );
                                        } else {
                                          return const Text('');
                                        }
                                      },
                                    ),
                                  ))
                            ]),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            }),
      ),
    );
  }
}
