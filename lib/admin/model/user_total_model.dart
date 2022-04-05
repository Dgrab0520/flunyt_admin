class UserTotal {
  String name;
  int count;

  UserTotal({
    required this.name,
    required this.count,
  });

  factory UserTotal.fromJson(Map<String, dynamic> json) {
    return UserTotal(
      count: json['count'] == null ? 0 : int.parse(json['count']),
      name: json['name'] == null ? "" : json['name'] as String,
    );
  }
}
