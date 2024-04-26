import 'package:flutter/material.dart';
import 'package:kitchenwise/models/recipe_list.dart';

class RecipeState extends InheritedWidget {
  const RecipeState({
    super.key,
    required this.data,
    required super.child,
  });

  final RecipeList data;

  static RecipeState of(BuildContext context) {
    final result = context.dependOnInheritedWidgetOfExactType<RecipeState>();
    
    assert(result != null, 'No RecipeState found in context');
    
    return result!;
  }

  @override
  bool updateShouldNotify(RecipeState oldWidget) => data != oldWidget.data;
}