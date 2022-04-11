class User {
  int id;
  String userId;
  String userPhone;
  String userIntroduce;
  String userSex;
  String userSNSType;
  String userSNSId;
  String userSNSRank;
  String userProfileImg;
  String userStatus;
  DateTime userRegisterDate;
  int point;
  int mileage;
  int campaignCount;

  User({
    required this.id,
    required this.userId,
    required this.userPhone,
    required this.userIntroduce,
    required this.userSex,
    required this.userSNSType,
    required this.userSNSId,
    required this.userSNSRank,
    required this.userProfileImg,
    required this.userStatus,
    required this.userRegisterDate,
    required this.point,
    required this.mileage,
    required this.campaignCount,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'] == null ? 0 : int.parse(json['id']),
      userId: json['user_id'] == null ? "" : json['user_id'] as String,
      userPhone: json['user_ph'] == null ? "" : json['user_ph'] as String,
      userIntroduce: json['user_introduce'] == null
          ? ""
          : json['user_introduce'] as String,
      userSex: json['user_sex'] == null ? "" : json['user_sex'] as String,
      userSNSType: json['sns_type'] == null ? "" : json['sns_type'] as String,
      userSNSId: json['user_sns'] == null ? "" : json['user_sns'] as String,
      userSNSRank: json['sns_rank'] == null ? "" : json['sns_rank'] as String,
      userProfileImg:
          json['profile_img'] == null ? "" : json['profile_img'] as String,
      userStatus:
          json['user_status'] == null ? "" : json['user_status'] as String,
      userRegisterDate: json['registerdate'] == null
          ? DateTime.now()
          : DateTime.parse(json['registerdate']),
      point: json['point'] == null ? 0 : int.parse(json['point']),
      mileage: json['mileage'] == null ? 0 : int.parse(json['mileage']),
      campaignCount: json['campaign'] == null ? 0 : int.parse(json['campaign']),
    );
  }
}
