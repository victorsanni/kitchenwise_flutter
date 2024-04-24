import 'package:flutter/material.dart';
import 'package:kitchenwise/constants.dart';
import 'package:kitchenwise/data/recipe_data.dart';
import 'package:kitchenwise/models/recipe_model.dart';
import 'package:kitchenwise/widgets/auth_widgets/login_button.dart';
import 'package:kitchenwise/widgets/recipe_widgets/recipe_cookware.dart';
import 'package:kitchenwise/widgets/recipe_widgets/recipe_ingredients.dart';
import 'package:kitchenwise/widgets/recipe_widgets/recipe_procedure.dart';

class RecipePage extends StatelessWidget {
  final String? recipeId;
  final String? imageUrl;
  const RecipePage({super.key, this.recipeId, this.imageUrl});

  @override
  Widget build(BuildContext context) {
    const List<Widget> tabs = [
      Tab(child: Text('Ingredients')),
      Tab(child: Text('Cookware')),
      Tab(child: Text('Procedure')),
    ];

    const List<Widget> tabViews = [
      RecipeIngredients(),
      RecipeCookware(),
      RecipeProcedure(),
    ];

    Recipe recipe = recipeData.getById(int.parse(recipeId!));

    return SafeArea(
      child: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height / 4,
            child: SizedBox.expand(
              child: Image.network(
                imageUrl!,
                fit: BoxFit.fill,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
                vertical: AppConstants.bottomPadding),
            child: Text(
              recipe.title,
              style: Theme.of(context).textTheme.labelLarge,
            ),
          ),
          DefaultTabController(
            length: 3,
            child: Expanded(
              child: Column(
                children: <Widget>[
                  ///ScaleTabBar
                  Builder(builder: (context) {
                    return TabBar(
                      tabs: tabs,
                      labelColor: Colors.black,
                      labelStyle: Theme.of(context)
                          .textTheme
                          .bodyLarge
                          ?.copyWith(fontSize: 15),
                      unselectedLabelStyle: Theme.of(context)
                          .textTheme
                          .bodyLarge
                          ?.copyWith(fontSize: 12),
                    );
                  }),
                  const Expanded(child: TabBarView(children: tabViews)),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(AppConstants.sidePadding, 0.0,
                AppConstants.sidePadding, AppConstants.bottomPadding),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Icon(
                  Icons.edit_outlined,
                  size: AppConstants.appIconSize,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width / 2,
                  child: LoginButton(
                    onPressed: () {},
                    centerText: 'Add to shopping list',
                    fontSize: 15.0,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
