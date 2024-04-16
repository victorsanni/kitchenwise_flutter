import 'package:flutter/material.dart';
import 'package:kitchenwise/constants.dart';
import 'package:kitchenwise/widgets/inventory_widgets/inventory_modal.dart';

class InventoryCard extends StatelessWidget {
  const InventoryCard({
    super.key,
    required this.title,
    required this.subtitle,
    this.image = const Image(
      image: AssetImage(
          'images/kitchenwise_icon.png'), // TODO: Replace with image loading animations
    ),
  });

  final String title;
  final String subtitle;
  final Image image;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        tileColor: Theme.of(context).colorScheme.tertiary,
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(AppConstants.imageRadius),
          child: Container(
            height: AppConstants.imageSize,
            width: AppConstants.imageSize,
            color: Colors.blueGrey,
            child: image,
          ),
        ),
        title: Text(title),
        subtitle: Text(subtitle),
        trailing: IconButton(
          onPressed: () {
            showModalBottomSheet(
              // TODO: Populate modal with pre-existing item values
              context: context,
              builder: (context) => const InventoryAddItemModal(
                title: 'Edit Item',
                isEditItem: true,
              ),
              constraints: BoxConstraints(
                  maxHeight:
                      MediaQuery.of(context).orientation == Orientation.portrait
                          ? AppConstants.modalHeightPortrait
                          : AppConstants.modalHeightLandscape),
            );
          },
          icon: const Icon(
            Icons.edit,
            size: AppConstants.appIconSize,
          ),
        ),
      ),
    );
  }
}
