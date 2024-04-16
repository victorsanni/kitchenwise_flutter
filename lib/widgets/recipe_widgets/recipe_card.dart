import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kitchenwise/constants.dart';
import 'package:transparent_image/transparent_image.dart';

class RecipeCard extends StatelessWidget {
  const RecipeCard({
    super.key,
    required this.title,
    this.imageUrl = '',
    this.imageHeight = 120,
  });

  final String title;
  final String imageUrl;
  final double imageHeight;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.go('/');
      },
      child: Column(
        children: [
          SizedBox(
            height: imageHeight,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Center(
                  child: CircularProgressIndicator(
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(AppConstants.imageRadius),
                  child: FadeInImage.memoryNetwork(
                    placeholder: kTransparentImage,
                    image: imageUrl,
                    fit: BoxFit.fill,
                  ),
                ),
              ],
            ),
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
    );
  }
}
