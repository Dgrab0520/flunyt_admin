class UserAuth {
  int id;
  String userId;
  String snsLink;
  String authResult;
  DateTime regDate;

  UserAuth({
    required this.id,
    required this.userId,
    required this.snsLink,
    required this.authResult,
    required this.regDate,
  });

  factory UserAuth.fromJson(Map<String, dynamic> json) {
    return UserAuth(
      id: json['id'] == null ? 0 : int.parse(json['id']),
      userId: json['user_id'] == null ? "" : json['user_id'] as String,
      snsLink: json['sns_link'] == null ? "" : json['sns_link'] as String,
      authResult:
          json['auth_result'] == null ? "" : json['auth_result'] as String,
      regDate: json['reg_date'] == null
          ? DateTime.now()
          : DateTime.parse(json['reg_date']),
    );
  }
}
