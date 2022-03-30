import 'package:flutter/material.dart';
import 'package:flutter_fire_shopping_list/models/shopping_item_model.dart';

class ItemEditDialog extends StatefulWidget {
  const ItemEditDialog({Key? key}) : super(key: key);

  @override
  State<ItemEditDialog> createState() => _ItemEditDialogState();
}

class _ItemEditDialogState extends State<ItemEditDialog> {
  late TextEditingController descriptionTextController;
  late TextEditingController quantityTextController;

  @override
  void initState() {
    super.initState();
    descriptionTextController = TextEditingController();
    quantityTextController = TextEditingController();
  }

  @override
  void dispose() {
    descriptionTextController.dispose();
    quantityTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Center(child: Text('Add New Item')),
      content: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 8.0),
          const Text('Item Description:'),
          TextField(
            controller: descriptionTextController,
            enableSuggestions: true,
            decoration: const InputDecoration(
                isDense: true, contentPadding: EdgeInsets.only(bottom: 6.0)),
          ),
          const SizedBox(height: 16.0),
          Row(
            children: [
              const Text('Quantity:  '),
              Expanded(
                child: TextField(
                  controller: quantityTextController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    isDense: true,
                    contentPadding: EdgeInsets.only(bottom: 6.0),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () {
            double? quantity = double.tryParse(quantityTextController.text);
            if (descriptionTextController.text.isEmpty) {
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  content: Text('Item Description is Required')));
            } else if (quantity == null) {
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  content: Text('Please Input Correct Quantity')));
            } else {
              Navigator.pop(
                  context,
                  ShoppingItemModel(
                      itemDescription: descriptionTextController.text,
                      quantity: quantity));
            }
          },
          child: const Text(
            'Confirm',
            style: TextStyle(fontSize: 20.0),
          ),
        ),
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text(
            'Cancel',
            style: TextStyle(fontSize: 20.0),
          ),
        ),
      ],
      actionsAlignment: MainAxisAlignment.spaceEvenly,
    );
  }
}
