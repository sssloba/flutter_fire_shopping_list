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

  Order.mocked()
      : creatorsEmail = 'test@mail',
        title = 'Test Order',
        shareWith = ['shareUserTest'];
}
