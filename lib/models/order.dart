import 'package:flutter_fire_shopping_list/consts/keys.dart';

class Order {
  final String creatorsEmail;
  final String title;
  final List<String>? shareWith;
  //DateTime lastEdit;
  final DateTime createTime;

  Order({
    required this.creatorsEmail,
    required this.title,
    this.shareWith,
    //this.lastEdit,
  }) : createTime = DateTime.now();

  //DateTime get createTime => DateTime.now();
  DateTime get lastEdit => DateTime.now();
  String get id => '${createTime.toIso8601String()}$creatorsEmail';
  //DateTime get lastEdited => lastEdit ?? createTime;

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
        shareWith: List.from(json[shareWithKey]));
  }

  Order.mocked()
      : creatorsEmail = 'test@mail',
        title = 'Test Order',
        shareWith = <String>['shareUserTest'],
        createTime = DateTime.now();
}
