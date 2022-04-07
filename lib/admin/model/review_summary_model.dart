class ReviewSummary {
  String allReviewCount;
  int monthReviewCount;
  DateTime firstDate;

  ReviewSummary({
    required this.allReviewCount,
    required this.monthReviewCount,
    required this.firstDate,
  });

  factory ReviewSummary.fromJson(Map<String, dynamic> json) {
    return ReviewSummary(
      allReviewCount: json['allReviewCount'] == null
          ? ""
          : json['allReviewCount'] as String,
      monthReviewCount: json['monthReviewCount'] == null
          ? 0
          : int.parse(json['monthReviewCount']),
      firstDate: json['firstDate'] == null
          ? DateTime.now()
          : DateTime.parse(json['firstDate']),
    );
  }
}
