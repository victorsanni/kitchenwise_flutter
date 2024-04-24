import 'package:flutter/material.dart';
import 'package:kitchenwise/data/inventory_data.dart';

class RecipeCookware extends StatelessWidget {
  const RecipeCookware({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Flexible(
          child: ListView.builder(
              itemCount: inventoryData.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Center(child: Text(inventoryData.inventoryList[index].name)),
                );
              }),
        ),
      ],
    );
  }
}
