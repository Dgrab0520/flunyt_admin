class PartnerSummary {
  String allClientCount;
  String monthCampaignCount;
  String completeCampaignCount;

  PartnerSummary({
    required this.allClientCount,
    required this.monthCampaignCount,
    required this.completeCampaignCount,
  });

  factory PartnerSummary.fromJson(Map<String, dynamic> json) {
    return PartnerSummary(
      allClientCount: json['allClientCount'] == null
          ? ""
          : json['allClientCount'] as String,
      monthCampaignCount: json['monthCampaignCount'] == null
          ? ""
          : json['monthCampaignCount'] as String,
      completeCampaignCount: json['completeCampaignCount'] == null
          ? ""
          : json['completeCampaignCount'] as String,
    );
  }
}
