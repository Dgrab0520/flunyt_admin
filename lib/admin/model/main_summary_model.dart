class MainSummary {
  String allUserCount;
  String monthJoinCount;
  String monthCampaignCount;

  MainSummary({
    required this.allUserCount,
    required this.monthJoinCount,
    required this.monthCampaignCount,
  });

  factory MainSummary.fromJson(Map<String, dynamic> json) {
    return MainSummary(
      allUserCount:
          json['allUserCount'] == null ? "" : json['allUserCount'] as String,
      monthJoinCount: json['monthJoinCount'] == null
          ? ""
          : json['monthJoinCount'] as String,
      monthCampaignCount: json['monthCampaignCount'] == null
          ? ""
          : json['monthCampaignCount'] as String,
    );
  }
}
