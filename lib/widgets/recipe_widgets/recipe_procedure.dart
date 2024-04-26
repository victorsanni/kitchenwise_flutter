import 'package:flutter/material.dart';
import 'package:kitchenwise/models/inventory_state.dart';

class RecipeProcedure extends StatelessWidget {
  const RecipeProcedure({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> procedures = [
      "Scour your pantry and assemble an army of gummy worms.",
      "Fill your largest pot with an eclectic mix of liquids.",
      "Grab a whisk and vigorously stir the potpourri of liquids.",
      "With a flourish, dump the entire gummy worm army into the pot.",
      "Set the stove to 'high' and let the concoction simmer for an indeterminate amount of time.",
      "While the concoction simmers, ransack your cupboards for any and all types of noodles.",
      "Carefully ladle the questionable concoction into a mismatched bowl.",
      "Arm yourself with a spoon and approach the Gummy Worm Gumbo with caution.",
      "Take a moment to admire the sheer absurdity of your creation.",
      "If by some miracle there are leftovers, consider immortalizing your creation."
    ];

    return Column(
      children: [
        Flexible(
          child: ListView.builder(
              itemCount: procedures.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Card(
                      elevation: 1.0,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 20.0, horizontal: 10.0),
                        child: Text(
                          procedures[index],
                          style: Theme.of(context)
                              .textTheme
                              .labelMedium
                              ?.copyWith(fontWeight: FontWeight.w900),
                        ),
                      )),
                );
              }),
        ),
      ],
    );
  }
}
