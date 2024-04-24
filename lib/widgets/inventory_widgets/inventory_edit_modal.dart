import 'package:flutter/material.dart';
import 'package:kitchenwise/constants.dart';
import 'package:kitchenwise/widgets/auth_widgets/login_button.dart';
import 'package:kitchenwise/widgets/inventory_widgets/inventory_modal.dart';

class InventoryEditItemModal extends StatelessWidget {
  const InventoryEditItemModal(
      {super.key, required this.title, required this.id});

  final String title;
  final int id;

  @override
  Widget build(BuildContext context) {
    return ModalBody(
      title: title,
      buttons: Row(
        children: [
          Expanded(
              child: LoginButton(
            onPressed: () {},
            centerText: 'confirm',
            buttonRadius: 0,
            padding: EdgeInsets.zero,
          )),
          const SizedBox(
            width: AppConstants.sidePadding,
          ),
          Expanded(
            child: LoginButton(
              onPressed: () {},
              centerText: 'delete item',
              isOutlineButton: true,
              buttonRadius: 0,
              padding: EdgeInsets.zero,
            ),
          ),
        ],
      ),
    );
  }
}
