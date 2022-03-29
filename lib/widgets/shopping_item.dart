import 'package:flutter/material.dart';
import 'package:flutter_fire_shopping_list/models/shopping_item_model.dart';

class ShoppingItem extends StatefulWidget {
  const ShoppingItem({
    Key? key,
    required this.itemModel,
    required this.onDelete,
  }) : super(key: key);

  final ShoppingItemModel itemModel;
  final Function() onDelete;

  @override
  State<ShoppingItem> createState() => _ShoppingItemState();
}

class _ShoppingItemState extends State<ShoppingItem> {
  late bool _isPicked;

  @override
  void initState() {
    super.initState();
    _isPicked = widget.itemModel.isPicked;
  }

  @override
  void didUpdateWidget(covariant ShoppingItem oldWidget) {
    super.didUpdateWidget(oldWidget);
    setState(() {
      _isPicked = widget.itemModel.isPicked;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        children: [
          Expanded(
              child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(widget.itemModel.itemDescription),
          )),
          Text(widget.itemModel.quantity.toString()),
          const SizedBox(width: 12.0),
          Checkbox(
              value: _isPicked,
              onChanged: (value) {
                widget.itemModel.onPicked();
                setState(() {
                  _isPicked = value!;
                });
              }),
          IconButton(onPressed: widget.onDelete, icon: const Icon(Icons.delete))
        ],
      ),
    );
  }
}
