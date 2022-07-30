import 'package:flutter_fire_shopping_list/consts/keys.dart';

class Order {
  final String creatorsEmail;
  final String title;
  final List<String>? shareWith;

  Order({
    required this.creatorsEmail,
    required this.title,
    this.shareWith,
  });

  DateTime get createTime => DateTime.now();
  String get id => '${createTime.toIso8601String()}$creatorsEmail';

  Map<String, dynamic> toJson() {
    return {
      creatorsEmailKey: creatorsEmail,
      titleKey: title,
      shareWithKey: shareWith,
      createTimeKey: createTime,
      idKey: id,
    };
  }

  factory Order.fromJson(Map<String, dynamic> json) {
    return Order(
        creatorsEmail: json[creatorsEmailKey],
        title: json[titleKey],
        shareWith: json[shareWithKey]);
  }

  Order.mocked()
      : creatorsEmail = 'test@mail',
        title = 'Test Order',
        shareWith = ['shareUserTest'];
}
