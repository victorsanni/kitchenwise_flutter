import 'package:flutter/material.dart';
import 'package:kitchenwise/constants.dart';

class RecipeCard extends StatelessWidget {
  const RecipeCard({
    super.key,
    required this.title,
    this.image = const Image(
      image: AssetImage(
          'images/kitchenwise_icon.png'), // TODO: Replace with image loading animations
    ),
  });

  final String title;
  final Image image;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(AppConstants.imageRadius),
          ),
          child: image,
        ),
        const SizedBox(
          height: AppConstants.imageTextPadding,
        ),
        Text(
          title,
          textAlign: TextAlign.center,
          maxLines: 2,
          style: Theme.of(context)
              .textTheme
              .labelLarge
              ?.copyWith(fontSize: AppConstants.recipeTextSize, overflow: TextOverflow.ellipsis),
        )
      ],
    );
  }
}
