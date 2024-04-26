import 'package:flutter/material.dart';

import 'package:kitchenwise/constants.dart';

import 'package:kitchenwise/models/inventory_state.dart';
import 'package:kitchenwise/widgets/auth_widgets/login_button.dart';
import 'package:kitchenwise/widgets/custom_text_form_field.dart';

class InventoryEditItemModal extends StatefulWidget {
  const InventoryEditItemModal({
    super.key,
    required this.title,
    required this.id,
  });

  final String title;
  final int id;

  @override
  State<InventoryEditItemModal> createState() => _InventoryEditItemModalState();
}

class _InventoryEditItemModalState extends State<InventoryEditItemModal> {
  TextEditingController? nameController;
  TextEditingController? quantityController;
  TextEditingController? unitController;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    nameController = TextEditingController(
        text: InventoryState.of(context).data.getById(widget.id).name);
    quantityController = TextEditingController(
        text: InventoryState.of(context)
            .data
            .getById(widget.id)
            .quantity
            .toString());
    unitController = TextEditingController(
        text: InventoryState.of(context).data.getById(widget.id).unit);
  }

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
          Row(
            children: [
              Expanded(
                  child: LoginButton(
                onPressed: () {
                  InventoryState.of(context).data.setById(
                      widget.id,
                      nameController!.text,
                      int.parse(quantityController!.text),
                      unitController!.text);
                  Navigator.of(context).pop();
                },
                centerText: 'confirm',
                buttonRadius: 0,
                padding: EdgeInsets.zero,
              )),
              const SizedBox(
                width: AppConstants.sidePadding,
              ),
              Expanded(
                child: LoginButton(
                  onPressed: () {
                    InventoryState.of(context).data.remove(widget.id);
                    Navigator.of(context).pop();
                  },
                  centerText: 'delete item',
                  isOutlineButton: true,
                  buttonRadius: 0,
                  padding: EdgeInsets.zero,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
