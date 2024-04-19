import 'package:flutter/material.dart';
import 'package:kitchenwise/constants.dart';
import 'package:kitchenwise/data/inventory_data.dart';
import 'package:kitchenwise/models/inventory_model.dart';
import 'package:kitchenwise/widgets/inventory_widgets/inventory_modal.dart';
import 'package:kitchenwise/widgets/inventory_widgets/inventory_card.dart';

class InventoryPage extends StatefulWidget {
  const InventoryPage({super.key});

  @override
  State<InventoryPage> createState() => _InventoryPageState();
}

class _InventoryPageState extends State<InventoryPage> {
  @override
  void initState() {
    super.initState();
    for (InventoryItem item in inventoryData) {
      item.setImageUrl();
    }
  }

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
                child: ListView.builder(
                  shrinkWrap: true,
                  itemBuilder: (context, index) => FutureBuilder(
                      future: inventoryData[index].imageUrl,
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return InventoryCard(
                            title: inventoryData[index].name,
                            subtitle:
                                '${inventoryData[index].quantity.toString()} ${inventoryData[index].unit}',
                            imageUrl: snapshot.data,
                          );
                        } else {
                          return const Text('');
                        }
                      }),
                  itemCount: inventoryData.length,
                ),
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
            builder: (context) => const InventoryAddItemModal(
              title: 'Add New Item',
            ),
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
