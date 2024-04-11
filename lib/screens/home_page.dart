import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:kitchenwise/constants.dart';
import 'package:kitchenwise/screens/recipe_grid.dart';
import 'package:kitchenwise/widgets/text_form_field.dart';

enum RecipeHeader { suggestedRecipes, myRecipes }

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  RecipeHeader selectedHeader = RecipeHeader.suggestedRecipes;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
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
                          style: selectedHeader == RecipeHeader.suggestedRecipes
                              ? Theme.of(context)
                                  .textTheme
                                  .labelLarge
                                  ?.copyWith(
                                    fontWeight: FontWeight.w900,
                                    color:
                                        Theme.of(context).colorScheme.secondary,
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
                                    color:
                                        Theme.of(context).colorScheme.secondary,
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
                      const Expanded(
                        child: CustomTextFormField(
                          hintText: 'Type Something...',
                          autocorrect: true,
                        ),
                      ),
                      const SizedBox(
                        width: AppConstants.sidePadding,
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.search,
                          size: AppConstants.appIconSize,
                          weight: AppConstants.buttonBorderThickness,
                        ),
                      ),
                    ],
                  ),
                  Expanded(
                    child: GridView.builder(
                      padding: const EdgeInsets.all(12.0),
                      gridDelegate: CustomGridDelegate(dimension: 240.0),
                      // Try uncommenting some of these properties to see the effect on the grid:
                      // itemCount: 20, // The default is that the number of grid tiles is infinite.
                      // scrollDirection: Axis.horizontal, // The default is vertical.
                      // reverse: true, // The default is false, going down (or left to right).
                      itemBuilder: (BuildContext context, int index) {
                        final math.Random random = math.Random(index);
                        return GridTile(
                          header: GridTileBar(
                            title: Text('$index',
                                style: const TextStyle(color: Colors.black)),
                          ),
                          child: Container(
                            margin: const EdgeInsets.all(12.0),
                            decoration: ShapeDecoration(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                              gradient: const RadialGradient(
                                colors: <Color>[
                                  Color(0x0F88EEFF),
                                  Color(0x2F0099BB)
                                ],
                              ),
                            ),
                            child: FlutterLogo(
                              style: FlutterLogoStyle.values[random
                                  .nextInt(FlutterLogoStyle.values.length)],
                            ),
                          ),
                        );
                      },
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
