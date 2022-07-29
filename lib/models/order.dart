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
  String get id => '$creatorsEmail${createTime.toIso8601String()}';

  Map<String, dynamic> toJson(Order order) {
    return {
      'creatorsEmail': creatorsEmail,
      'title': title,
      'shareWith': shareWith,
      'createTime': createTime,
      'id': id,
    };
  }

  factory Order.fromJson(Map<String, dynamic> json) {
    return Order(
        creatorsEmail: json['creatorsEmail'],
        title: json['title'],
        shareWith: json['shareWith']);
  }
}
