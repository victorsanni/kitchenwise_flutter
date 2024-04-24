import 'package:flutter/material.dart';
import 'package:kitchenwise/constants.dart';
import 'package:kitchenwise/widgets/custom_text_form_field.dart';

class ModalBody extends StatelessWidget {
  const ModalBody({
    super.key,
    required this.title,
    required this.buttons,
  });

  final String title;
  final Widget buttons;

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
          buttons,
        ],
      ),
    );
  }
}
