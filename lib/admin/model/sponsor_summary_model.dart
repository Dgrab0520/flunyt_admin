class SponsorSummary {
  String allSponsorCount;
  String monthSponsorCount;
  String completeSponsorCount;

  SponsorSummary({
    required this.allSponsorCount,
    required this.monthSponsorCount,
    required this.completeSponsorCount,
  });

  factory SponsorSummary.fromJson(Map<String, dynamic> json) {
    return SponsorSummary(
      allSponsorCount: json['allSponsorCount'] == null
          ? ""
          : json['allSponsorCount'] as String,
      monthSponsorCount: json['monthSponsorCount'] == null
          ? ""
          : json['monthSponsorCount'] as String,
      completeSponsorCount: json['completeSponsorCount'] == null
          ? ""
          : json['completeSponsorCount'] as String,
    );
  }
}
