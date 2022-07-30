import 'package:flutter_fire_shopping_list/consts/keys.dart';
import 'package:uuid/uuid.dart';

class ShoppingItemModel {
  final String orderId;
  final String id;
  final String itemDescription;
  final double quantity;
  bool isPicked;

  ShoppingItemModel({
    required this.itemDescription,
    required this.orderId,
    this.quantity = 1.0,
    this.isPicked = false,
  }) : id = const Uuid().v4();

  void onPicked() => isPicked = !isPicked;

  Map<String, dynamic> toJson() {
    return {
      idKey: id,
      orderIdKey: orderId,
      itemDescriptionKey: itemDescription,
      quantityKey: quantity,
      isPickedKey: isPicked,
    };
  }

  factory ShoppingItemModel.fromJson(Map<String, dynamic> json) {
    return ShoppingItemModel(
      orderId: json[orderIdKey],
      itemDescription: json[itemDescriptionKey],
      quantity: json[quantityKey],
      isPicked: json[isPickedKey],
    );
  }
}
