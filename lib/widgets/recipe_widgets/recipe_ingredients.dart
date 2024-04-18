import 'package:flutter/material.dart';
import 'package:kitchenwise/data/inventory_data.dart';

class RecipeIngredients extends StatelessWidget {
  const RecipeIngredients({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'You have',
          style: Theme.of(context).textTheme.labelLarge,
        ),
        Expanded(
          child: ListView.builder(
              itemCount: inventoryData.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(inventoryData[index].name),
                  trailing: Text(
                      '${inventoryData[index].quantity} ${inventoryData[index].unit}'),
                );
              }),
        ),
        Text(
          'You need',
          style: Theme.of(context).textTheme.labelLarge,
        ),
        Expanded(
          child: ListView.builder(
              itemCount: inventoryData.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(inventoryData[index].name),
                  trailing: Text(
                      '${inventoryData[index].quantity} ${inventoryData[index].unit}'),
                );
              }),
        ),
      ],
    );
  }
}
