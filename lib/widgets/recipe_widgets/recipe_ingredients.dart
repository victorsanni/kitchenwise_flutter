import 'package:flutter/material.dart';
import 'package:kitchenwise/models/inventory_state.dart';

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
              itemCount: InventoryState.of(context).data.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(InventoryState.of(context).data.inventoryList[index].name),
                  trailing: Text(
                      '${InventoryState.of(context).data.inventoryList[index].quantity} ${InventoryState.of(context).data.inventoryList[index].unit}'),
                );
              }),
        ),
        Text(
          'You need',
          style: Theme.of(context).textTheme.labelLarge,
        ),
        Expanded(
          child: ListView.builder(
              itemCount: InventoryState.of(context).data.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(InventoryState.of(context).data.inventoryList[index].name),
                  trailing: Text(
                      '${InventoryState.of(context).data.inventoryList[index].quantity} ${InventoryState.of(context).data.inventoryList[index].unit}'),
                );
              }),
        ),
      ],
    );
  }
}
