import 'package:flutter/material.dart';
import 'package:kitchenwise/constants.dart';
import 'package:kitchenwise/widgets/login_button.dart';
import 'package:kitchenwise/widgets/text_form_field.dart';

class InventoryAddItemModal extends StatelessWidget {
  const InventoryAddItemModal(
      {super.key, required this.title, this.isEditItem = false});

  final String title;
  final bool isEditItem;

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
              title,
              style: Theme.of(context).textTheme.labelLarge,
            ),
          ),
          Expanded(
            flex: 2,
            child: ListView(
              children: const [
                Expanded(
                  child: CustomTextFormField(
                    hintText: 'food name',
                    autocorrect: true,
                  ),
                ),
                SizedBox(
                  height: AppConstants.modalHorizPadding,
                ),
                Row(
                  children: [
                    Expanded(
                      child: CustomTextFormField(
                        hintText: 'quantity',
                      ),
                    ),
                    SizedBox(
                      width: AppConstants.sidePadding,
                    ),
                    Expanded(
                      flex: 2,
                      child: CustomTextFormField(
                        hintText: 'unit',
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
                onPressed: () {},
                centerText: 'confirm',
                buttonRadius: 0,
                padding: EdgeInsets.zero,
              )),
              isEditItem
                  ? const SizedBox(
                      width: AppConstants.sidePadding,
                    )
                  : const Text(''),
              isEditItem
                  ? Expanded(
                      child: LoginButton(
                        onPressed: () {},
                        centerText: 'delete item',
                        isOutlineButton: true,
                        buttonRadius: 0,
                        padding: EdgeInsets.zero,
                      ),
                    )
                  : const Text('')
            ],
          )
        ],
      ),
    );
  }
}
