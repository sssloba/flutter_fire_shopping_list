import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_fire_shopping_list/consts/keys.dart';
import 'package:flutter_fire_shopping_list/models/order.dart';

class OrdersPage extends StatelessWidget {
  const OrdersPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Orders'),
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection(ordersKey).snapshots(),
        builder: (BuildContext context,
            AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasData) {
            final orders = snapshot.data!.docs;
            return ListView.builder(
                itemCount: orders.length,
                itemBuilder: ((BuildContext context, int index) {
                  final Order order = Order.fromJson(orders[index].data());
                  return Card(
                    child: ListTile(
                      title: Text('Order: ${order.title}'),
                      subtitle: Text('Date Created: ${order.createTime}'),
                      onTap: Navigator.of(context).pop,
                    ),
                  );
                }));
          } else {
            return const Center(
              child: Text('No orders found'),
            );
          }
        },
      ),
    );
  }
}
