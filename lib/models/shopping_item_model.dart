import 'package:uuid/uuid.dart';

class ShoppingItemModel {
  final String id;
  final String itemDescription;
  final double quantity;
  bool isPicked;

  ShoppingItemModel({
    required this.itemDescription,
    this.quantity = 1.0,
    this.isPicked = false,
  }) : id = const Uuid().v4();

  void onPicked() => isPicked = !isPicked;
}
