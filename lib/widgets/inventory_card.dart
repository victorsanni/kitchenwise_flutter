import 'package:flutter/material.dart';
import 'package:kitchenwise/constants.dart';

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
        trailing: const Icon(
          Icons.edit,
          size: AppConstants.appIconSize,
        ),
      ),
    );
  }
}
