import 'package:flutter/material.dart';
import 'package:kitchenwise/constants.dart';
import 'package:kitchenwise/models/inventory_state.dart';
import 'package:kitchenwise/widgets/inventory_widgets/inventory_edit_modal.dart';
import 'package:transparent_image/transparent_image.dart';

class InventoryCard extends StatelessWidget {
  const InventoryCard({
    super.key,
    required this.imageUrl,
    required this.id,
  });

  final int id;
  final String? imageUrl;

  @override
  Widget build(BuildContext context) {
    final String title = InventoryState.of(context).data.getById(id).name;
    final int quantity = InventoryState.of(context).data.getById(id).quantity;
    final String unit = InventoryState.of(context).data.getById(id).unit;
    
    return Card(
      child: ListTile(
        tileColor: Theme.of(context).colorScheme.tertiary,
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(AppConstants.imageRadius),
          child: Container(
            height: AppConstants.imageSize,
            width: AppConstants.imageSize,
            color: Colors.blueGrey,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Center(
                  child: CircularProgressIndicator(
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
                imageUrl == null
                    ? const Text('')
                    : ClipRRect(
                        borderRadius:
                            BorderRadius.circular(AppConstants.imageRadius),
                        child: SizedBox.expand(
                          child: FadeInImage.memoryNetwork(
                            placeholder: kTransparentImage,
                            image: imageUrl!,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
              ],
            ),
          ),
        ),
        title: Text(title),
        subtitle: Text(
          '${quantity.toString()} $unit',
        ),
        trailing: IconButton(
          onPressed: () {
            showModalBottomSheet(
              context: context,
              builder: (context) => InventoryEditItemModal(
                id: id,
                title: 'Edit Item',
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
