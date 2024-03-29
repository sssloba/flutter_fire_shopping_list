import 'package:flutter/material.dart';
import 'package:flutter_fire_shopping_list/models/order.dart';
import 'package:flutter_fire_shopping_list/screens/orders_page.dart';
import 'package:flutter_fire_shopping_list/screens/shopping_list_page.dart';
import 'package:flutter_fire_shopping_list/services/auth_service.dart';
import 'package:flutter_fire_shopping_list/services/firestore_manager.dart';
import 'package:flutter_fire_shopping_list/widgets/stadium_button.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shopping List'),
        centerTitle: true,
      ),
      endDrawer: Drawer(
        child: ListView(
          children: [
            ListTile(
              onTap: () async {
                await AuthService().signOut();
                Navigator.popUntil(
                    context, (Route<dynamic> route) => route.isFirst);
              },
              title: const Text(
                'LOGOUT',
                style: TextStyle(color: Colors.red),
                selectionColor: Colors.red,
              ),
            )
          ],
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
              StadimButton(
                title: 'Create New List',
                onPressed: () {
                  FirestoreManager().addNewOrder(Order.mocked());
                  return Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const ShoppingListPage(),
                    ),
                  );
                },
              ),
              const SizedBox(height: 16.0),
              StadimButton(
                  title: 'See Existing Lists',
                  onPressed: () {
                    return Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const OrdersPage(),
                      ),
                    );
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
