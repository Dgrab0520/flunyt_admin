class Coupon {
  int id;
  String couponId;
  String couponBrand;
  String couponBrandImg;
  String couponImg;
  String couponTitle;
  String couponDetail;
  DateTime couponDate;
  String couponNotice;
  DateTime couponRegisterDate;
  bool useCoupon;

  Coupon({
    required this.id,
    required this.couponId,
    required this.couponBrand,
    required this.couponBrandImg,
    required this.couponImg,
    required this.couponTitle,
    required this.couponDetail,
    required this.couponDate,
    required this.couponNotice,
    required this.couponRegisterDate,
    required this.useCoupon,
  });

  factory Coupon.fromJson(Map<String, dynamic> json) {
    return Coupon(
      id: json['id'] == null ? 0 : int.parse(json['id']),
      couponId: json['coupon_id'] == null ? "" : json['coupon_id'] as String,
      couponBrand:
          json['coupon_brand'] == null ? "" : json['coupon_brand'] as String,
      couponBrandImg:
          json['brand_image'] == null ? "" : json['brand_image'] as String,
      couponImg:
          json['coupon_image'] == null ? "" : json['coupon_image'] as String,
      couponTitle:
          json['coupon_title'] == null ? "" : json['coupon_title'] as String,
      couponDetail:
          json['coupon_detail'] == null ? "" : json['coupon_detail'] as String,
      couponDate: json['coupon_date'] == null
          ? DateTime.now()
          : DateTime.parse(json['coupon_date']),
      couponNotice:
          json['coupon_notice'] == null ? "" : json['coupon_notice'] as String,
      couponRegisterDate: json['register_date'] == null
          ? DateTime.now()
          : DateTime.parse(json['register_date']),
      useCoupon: json['useCoupon'] == null ? false : true,
    );
  }
}
