import 'package:flutter/material.dart';
import 'package:kitchenwise/constants.dart';
import 'package:kitchenwise/data/inventory_data.dart';
import 'package:kitchenwise/models/inventory_model.dart';
import 'package:kitchenwise/widgets/auth_widgets/login_button.dart';
import 'package:kitchenwise/widgets/custom_text_form_field.dart';

class InventoryAddItemModal extends StatefulWidget {
  const InventoryAddItemModal({super.key, required this.title});

  final String title;

  @override
  State<InventoryAddItemModal> createState() => _InventoryAddItemModalState();
}

class _InventoryAddItemModalState extends State<InventoryAddItemModal> {
  TextEditingController? nameController = TextEditingController();
  TextEditingController? quantityController = TextEditingController();
  TextEditingController? unitController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    nameController!.dispose();
    quantityController!.dispose();
    unitController!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: AppConstants.modalHorizPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
                vertical: AppConstants.modalVerticalPadding),
            child: Text(
              widget.title,
              style: Theme.of(context).textTheme.labelLarge,
            ),
          ),
          Expanded(
            flex: 2,
            child: ListView(
              children: [
                CustomTextFormField(
                  hintText: 'food name',
                  autocorrect: true,
                  controller: nameController,
                ),
                const SizedBox(
                  height: AppConstants.modalHorizPadding,
                ),
                Row(
                  children: [
                    Expanded(
                      child: CustomTextFormField(
                        hintText: 'quantity',
                        controller: quantityController,
                      ),
                    ),
                    const SizedBox(
                      width: AppConstants.sidePadding,
                    ),
                    Expanded(
                      flex: 2,
                      child: CustomTextFormField(
                        hintText: 'unit',
                        controller: unitController,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
              child: LoginButton(
            onPressed: () {
              setState(() {
                // TODO: Use state management here and notify listeners
                inventoryData.add(
                  InventoryItem(
                      name: nameController!.text,
                      quantity: int.parse(quantityController!.text),
                      unit: unitController!.text),
                );
              });
              Navigator.of(context).pop();
            },
            centerText: 'confirm',
            buttonRadius: 0,
            padding: EdgeInsets.zero,
          )),
        ],
      ),
    );
  }
}
