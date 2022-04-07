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
      bannerId:
          json['subbanner_id'] == null ? "" : json['subbanner_id'] as String,
      bannerImg:
          json['subbanner_img'] == null ? "" : json['subbanner_img'] as String,
      bannerStatus: json['subbanner_status'] == null
          ? ""
          : json['subbanner_status'] == "start"
              ? "진행중"
              : "종료",
      bannerRegisterDate: json['subbanner_registe_date'] == null
          ? DateTime.now()
          : DateTime.parse(json['subbanner_registe_date']),
    );
  }
}
