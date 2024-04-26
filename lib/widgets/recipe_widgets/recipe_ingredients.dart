import 'package:flutter/material.dart';
import 'package:kitchenwise/models/inventory_state.dart';

class RecipeIngredients extends StatelessWidget {
  const RecipeIngredients({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> ingredients = [
      {"name": "All-purpose flour", "quantity": 2, "unit": "cups"},
      {"name": "Granulated sugar", "quantity": 0.5, "unit": "cup"},
      {"name": "Large eggs", "quantity": 3, "unit": "each"},
      {"name": "Unsalted butter", "quantity": 1, "unit": "stick"},
      {"name": "Baking powder", "quantity": 1, "unit": "teaspoon"},
      {"name": "Baking soda", "quantity": 0.5, "unit": "teaspoon"},
      {"name": "Salt", "quantity": 0.25, "unit": "teaspoon"},
      {"name": "Milk", "quantity": 1, "unit": "cup"},
      {"name": "Vanilla extract", "quantity": 1, "unit": "teaspoon"},
      {"name": "Chocolate chips", "quantity": 1, "unit": "cup"},
    ];
    return Column(
      children: [
        Text(
          'You have',
          style: Theme.of(context).textTheme.labelLarge,
        ),
        Expanded(
          child: ListView.builder(
              itemCount: InventoryState.of(context).data.length,
              itemBuilder: (context, index) {
                return Card(
                  elevation: 1.0,
                  child: ListTile(
                    title: Text(InventoryState.of(context)
                        .data
                        .inventoryList[index]
                        .name),
                    trailing: Text(
                        '${InventoryState.of(context).data.inventoryList[index].quantity} ${InventoryState.of(context).data.inventoryList[index].unit}'),
                  ),
                );
              }),
        ),
        Text(
          'You need',
          style: Theme.of(context).textTheme.labelLarge,
        ),
        Expanded(
          child: ListView.builder(
              itemCount: ingredients.length,
              itemBuilder: (context, index) {
                return Card(
                  elevation: 1.0,
                  child: ListTile(
                    title: Text(ingredients[index]['name']),
                    trailing: Text(
                        '${ingredients[index]['quantity']} ${ingredients[index]['unit']}'),
                  ),
                );
              }),
        ),
      ],
    );
  }
}
