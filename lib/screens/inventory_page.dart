import 'package:flutter/material.dart';
import 'package:kitchenwise/constants.dart';
import 'package:kitchenwise/data/inventory_data.dart';
import 'package:kitchenwise/widgets/inventory_modal.dart';
import 'package:kitchenwise/widgets/inventory_card.dart';

class InventoryPage extends StatelessWidget {
  const InventoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.symmetric(
              horizontal: AppConstants.sidePadding,
              vertical: AppConstants.topPadding),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'My Items',
                    style: Theme.of(context).textTheme.labelLarge,
                  ),
                  const Row(
                    children: [
                      Icon(
                        Icons.search,
                        size: AppConstants.appIconSize,
                      ),
                      SizedBox(
                        width: AppConstants.sidePadding,
                      ),
                      Icon(
                        Icons.more_horiz_outlined,
                        size: AppConstants.appIconSize,
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: AppConstants.headerPadding,
              ),
              Expanded(
                child: ListView(
                    shrinkWrap: true,
                    children: inventoryData
                        .map((item) => InventoryCard(
                            title: item.name,
                            subtitle:
                                '${item.quantity.toString()} ${item.unit}'))
                        .toList()),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).colorScheme.secondary,
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (context) => const InventoryAddItemModal(title: 'Add New Item',),
            constraints: BoxConstraints(
                maxHeight:
                    MediaQuery.of(context).orientation == Orientation.portrait
                        ? AppConstants.modalHeightPortrait
                        : AppConstants.modalHeightLandscape),
          );
        },
        child: const Icon(
          Icons.add,
          size: AppConstants.appIconSize,
          color: Colors.white,
        ),
      ),
    );
  }
}
