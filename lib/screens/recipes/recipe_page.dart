import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kitchenwise/constants.dart';
import 'package:kitchenwise/data/recipe_data.dart';
import 'package:kitchenwise/models/recipe_model.dart';
import 'package:kitchenwise/widgets/auth_widgets/login_button.dart';
import 'package:kitchenwise/widgets/recipe_widgets/recipe_cookware.dart';
import 'package:kitchenwise/widgets/recipe_widgets/recipe_ingredients.dart';
import 'package:kitchenwise/widgets/recipe_widgets/recipe_procedure.dart';

class RecipePage extends StatelessWidget {
  final String? id;
  final String? imageUrl;
  const RecipePage({super.key, this.id, this.imageUrl});

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

    Recipe recipe = recipeData.getById(int.parse(id!));

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
            padding: const EdgeInsets.fromLTRB(
                AppConstants.sidePadding,
                AppConstants.bottomPadding,
                AppConstants.sidePadding,
                AppConstants.bottomPadding),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                !recipe.isMine
                    ? SizedBox(
                        width: MediaQuery.of(context).size.width / 3,
                        child: LoginButton(
                          isOutlineButton: true,
                          onPressed: () {
                            recipeData.makeMineById(int.parse(id!));
                            showDialog(
                              context: context,
                              builder: (context) {
                                return const CupertinoAlertDialog(
                                    title: Text("Added to my Recipes!"));
                              },
                            );
                          },
                          centerText: 'Add to my recipes',
                          fontSize: 12.0,
                        ),
                      )
                    : SizedBox(
                        width: MediaQuery.of(context).size.width / 2.5,
                        child: LoginButton(
                          isOutlineButton: true,
                          onPressed: () {
                            recipeData.makeNotMineById(int.parse(id!));
                            showDialog(
                              context: context,
                              builder: (context) {
                                return const CupertinoAlertDialog(
                                    title: Text("Removed from my Recipes!"));
                              },
                            );
                          },
                          centerText: 'Remove from my recipes',
                          fontSize: 12.0,
                        ),
                      ),
                SizedBox(
                  width: MediaQuery.of(context).size.width / 3,
                  child: LoginButton(
                    onPressed: () {},
                    centerText: 'Add to shopping list',
                    fontSize: 13.0,
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
