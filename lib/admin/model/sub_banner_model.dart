class SubBanner {
  int id;
  String bannerId;
  String bannerImg;
  String bannerStatus;
  DateTime bannerRegisterDate;

  SubBanner({
    required this.id,
    required this.bannerId,
    required this.bannerImg,
    required this.bannerStatus,
    required this.bannerRegisterDate,
  });

  factory SubBanner.fromJson(Map<String, dynamic> json) {
    return SubBanner(
      id: json['id'] == null ? 0 : int.parse(json['id']),
      bannerId: json['banner_id'] == null ? "" : json['banner_id'] as String,
      bannerImg: json['banner_img'] == null ? "" : json['banner_img'] as String,
      bannerStatus: json['status'] == null ? "" : json['status'] as String,
      bannerRegisterDate: json['register_date'] == null
          ? DateTime.now()
          : DateTime.parse(json['register_date']),
    );
  }
}
