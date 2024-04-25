import 'package:flutter/material.dart';
import 'package:kitchenwise/models/inventory_state.dart';

class RecipeProcedure extends StatelessWidget {
  const RecipeProcedure({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Flexible(
          child: ListView.builder(
              itemCount: InventoryState.of(context).data.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Center(child: Text(InventoryState.of(context).data.inventoryList[index].name)),
                );
              }),
        ),
      ],
    );
  }
}
