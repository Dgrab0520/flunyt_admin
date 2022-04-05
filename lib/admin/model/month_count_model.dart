class MonthCount {
  String month;
  int count;

  MonthCount({
    required this.month,
    required this.count,
  });

  factory MonthCount.fromJson(Map<String, dynamic> json) {
    return MonthCount(
      count: json['count'] == null ? 0 : int.parse(json['count']),
      month: json['monthName'] == null ? "" : json['monthName'] as String,
    );
  }
}
