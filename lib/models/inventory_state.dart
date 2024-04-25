import 'package:flutter/material.dart';
import 'package:kitchenwise/models/inventory_list.dart';

class InventoryState extends InheritedWidget {
  const InventoryState({
    super.key,
    required this.data,
    required super.child,
  });

  final InventoryList data;

  static InventoryState of(BuildContext context) {
    final result = context.dependOnInheritedWidgetOfExactType<InventoryState>();
    
    assert(result != null, 'No InventoryState found in context');
    
    return result!;
  }

  @override
  bool updateShouldNotify(InventoryState oldWidget) => data != oldWidget.data;
}