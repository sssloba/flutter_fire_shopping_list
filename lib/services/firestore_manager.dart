import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_fire_shopping_list/models/order.dart';

class FirestoreManager {
  factory FirestoreManager() {
    _singleton ??= FirestoreManager._();
    return _singleton!;
  }
  FirestoreManager._();
  static FirestoreManager? _singleton;

  void addNewOrder(Order order) async {
    return FirebaseFirestore.instance
        .collection('orders')
        .doc(order.id)
        .set(order.toJson())
        .then((_) => debugPrint('Order added'))
        .onError((error, stackTrace) =>
            debugPrint('Error $error occurs during new order creation'));
    //return FirebaseFirestore.instance.collection('orders').add(order.toJson());
  }
}
