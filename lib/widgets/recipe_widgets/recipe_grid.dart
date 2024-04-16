import 'package:flutter/material.dart';
import 'package:kitchenwise/constants.dart';
import 'package:kitchenwise/data/recipe_data.dart';
import 'package:kitchenwise/widgets/recipe_widgets/recipe_card.dart';
import 'package:kitchenwise/widgets/text_form_field.dart';

class RecipeGrid extends StatelessWidget {
  const RecipeGrid({
    super.key,
    required this.searchController,
  });

  final TextEditingController searchController;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
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
        ),
        SliverPadding(
          padding: const EdgeInsets.symmetric(
              vertical: AppConstants.gridVerticalPadding,
              horizontal: AppConstants.sidePadding),
          sliver: SliverGrid.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: AppConstants.sidePadding,
              crossAxisSpacing: AppConstants.sidePadding,
              childAspectRatio:
                  MediaQuery.of(context).orientation == Orientation.landscape
                      ? AppConstants.landscapeAspectRatio
                      : AppConstants.portraitAspectRatio,
            ),
            itemCount: recipeData.length,
            itemBuilder: (context, index) => RecipeCard(
              title: recipeData[index].title,
              imageUrl: recipeData[index].imageUrl,
              imageHeight: AppConstants.imageHeight,
            ),
          ),
        ),
      ],
    );
  }
}
