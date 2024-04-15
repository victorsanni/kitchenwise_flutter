import 'package:flutter/material.dart';
import 'package:kitchenwise/constants.dart';
import 'package:transparent_image/transparent_image.dart';

class RecipeCard extends StatelessWidget {
  const RecipeCard({
    super.key,
    required this.title,
    this.imageUrl = '',
  });

  final String title;
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Center(
            child: CircularProgressIndicator(
          color: Theme.of(context).colorScheme.secondary,
        )),
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            FadeInImage.memoryNetwork(
              placeholder: kTransparentImage,
              image: imageUrl,
              fit: BoxFit.cover,
            ),
            const SizedBox(
              height: AppConstants.imageTextPadding,
            ),
            Text(
              title,
              textAlign: TextAlign.center,
              maxLines: 2,
              style: Theme.of(context).textTheme.labelLarge?.copyWith(
                  fontSize: AppConstants.recipeTextSize,
                  overflow: TextOverflow.ellipsis),
            )
          ],
        ),
      ],
    );
  }
}
