import 'package:flutter/material.dart';
import 'package:kitchenwise/constants.dart';
import 'package:kitchenwise/models/inventory_list.dart';
import 'package:kitchenwise/models/inventory_model.dart';

import 'package:kitchenwise/models/inventory_state.dart';
import 'package:kitchenwise/widgets/inventory_widgets/inventory_add_modal.dart';
import 'package:kitchenwise/widgets/inventory_widgets/inventory_card.dart';

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
                child: InventoryListview(),
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

class InventoryListview extends StatelessWidget {
  const InventoryListview({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemBuilder: (context, index) => FutureBuilder(
          future: InventoryState.of(context).data.inventoryList[index].imageUrl,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              InventoryList invList = InventoryState.of(context).data;
              return ListenableBuilder(
                  listenable: invList,
                  builder: (context, child) {
                    return InventoryCard(
                      id: invList.inventoryList[index].id,
                      imageUrl: snapshot.data,
                    );
                  });
            } else {
              return const Text('');
            }
          }),
      itemCount: InventoryState.of(context).data.length,
    );
  }
}
