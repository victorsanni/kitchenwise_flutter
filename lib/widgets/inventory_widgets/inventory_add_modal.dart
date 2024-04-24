import 'package:flutter/material.dart';
import 'package:kitchenwise/widgets/auth_widgets/login_button.dart';
import 'package:kitchenwise/widgets/inventory_widgets/inventory_modal.dart';

class InventoryAddItemModal extends StatelessWidget {
  const InventoryAddItemModal(
      {super.key, required this.title});

  final String title;

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
        ],
      ),
    );
  }
}
