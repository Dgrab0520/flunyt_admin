class DataList {
  String keyword;
  int count;

  DataList({
    required this.keyword,
    required this.count,
  });

  factory DataList.fromJson(Map<String, dynamic> json) {
    return DataList(
      count: json['count'] == null ? 0 : int.parse(json['count']),
      keyword: json['keyword'] == null ? "" : json['keyword'] as String,
    );
  }
}
