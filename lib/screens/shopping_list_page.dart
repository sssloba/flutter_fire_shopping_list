import 'package:flutter/material.dart';

class ShoppingListPage extends StatelessWidget {
  const ShoppingListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('New Shopping List'),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton.extended(
        label: const Text('Add New Shopping Item'),
        icon: const Icon(Icons.add),
        onPressed: () {},
      ),
    );
  }
}
