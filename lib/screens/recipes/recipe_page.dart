import 'package:flutter/material.dart';
import 'package:kitchenwise/constants.dart';
import 'package:kitchenwise/widgets/auth_widgets/login_button.dart';
import 'package:kitchenwise/widgets/recipe_widgets/recipe_cookware.dart';
import 'package:kitchenwise/widgets/recipe_widgets/recipe_ingredients.dart';
import 'package:kitchenwise/widgets/recipe_widgets/recipe_procedure.dart';

class RecipePage extends StatelessWidget {
  const RecipePage({super.key});

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

    return SafeArea(
      child: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height / 5,
            child: SizedBox.expand(
              child: Image.network(
                'https://upload.wikimedia.org/wikipedia/commons/4/4b/Beans_in_a_supermarket.jpg',
                fit: BoxFit.fill,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
                vertical: AppConstants.bottomPadding),
            child: Text(
              'Fried Rice',
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
