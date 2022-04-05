class MainBanner {
  int id;
  String bannerId;
  String bannerMainTitle;
  String bannerSubTitle;
  String bannerImg;
  String bannerDetailImg;
  String bannerStatus;
  DateTime bannerRegisterDate;

  MainBanner({
    required this.id,
    required this.bannerId,
    required this.bannerMainTitle,
    required this.bannerSubTitle,
    required this.bannerImg,
    required this.bannerDetailImg,
    required this.bannerStatus,
    required this.bannerRegisterDate,
  });

  factory MainBanner.fromJson(Map<String, dynamic> json) {
    return MainBanner(
      id: json['id'] == null ? 0 : int.parse(json['id']),
      bannerId: json['banner_id'] == null ? "" : json['banner_id'] as String,
      bannerMainTitle: json['banner_main_title'] == null
          ? ""
          : json['banner_main_title'] as String,
      bannerSubTitle: json['banner_sub_title'] == null
          ? ""
          : json['banner_sub_title'] as String,
      bannerImg: json['banner_img'] == null ? "" : json['banner_img'] as String,
      bannerDetailImg: json['banner_detail_img'] == null
          ? ""
          : json['banner_detail_img'] as String,
      bannerStatus: json['status'] == null ? "" : json['status'] as String,
      bannerRegisterDate: json['register_date'] == null
          ? DateTime.now()
          : DateTime.parse(json['register_date']),
    );
  }
}
