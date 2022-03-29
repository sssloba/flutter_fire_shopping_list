import 'package:flutter/material.dart';
import 'package:flutter_fire_shopping_list/models/shopping_item_model.dart';
import 'package:flutter_fire_shopping_list/widgets/shopping_item.dart';

class ShoppingListPage extends StatefulWidget {
  const ShoppingListPage({Key? key}) : super(key: key);

  @override
  State<ShoppingListPage> createState() => _ShoppingListPageState();
}

class _ShoppingListPageState extends State<ShoppingListPage> {
  late List<ShoppingItem> _itemList;

  @override
  void initState() {
    super.initState();
    _itemList = <ShoppingItem>[];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('New Shopping List'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: const [
                Expanded(
                    child: Text(
                  'Description',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
                )),
                Text(
                  'Qty',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
                ),
                SizedBox(width: 12.0),
                Text(
                  'Picked?',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
                ),
                SizedBox(width: 36.0),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: _itemList.length,
              itemBuilder: (BuildContext context, int index) {
                return _itemList[index];
              },
            ),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
        label: const Text('Add New Shopping Item'),
        icon: const Icon(Icons.add),
        onPressed: () {
          setState(() {
            _itemList.add(_getMockedShoppingItem());
          });
        },
      ),
    );
  }

  ShoppingItem _getMockedShoppingItem() {
    ShoppingItemModel _shoppingItem = ShoppingItemModel(
      itemDescription: 'Mocked Item',
      //quantity: 8000.88,
    );

    return ShoppingItem(
      itemModel: _shoppingItem,
      onDelete: () {
        setState(() {
          _itemList.removeWhere(
              (element) => element.itemModel.id == _shoppingItem.id);
        });
      },
    );
  }
}
