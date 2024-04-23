import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kitchenwise/constants.dart';
import 'package:transparent_image/transparent_image.dart';

class RecipeCard extends StatelessWidget {
  const RecipeCard({
    super.key,
    required this.title,
    required this.imageUrl,
    required this.id,
    this.imageHeight = 120.0,
  });

  final String title;
  final String? imageUrl;
  final double imageHeight;
  final int id;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.goNamed('recipe_page',
            queryParameters: {'recipeId': id.toString(), 'imageUrl': imageUrl});
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
