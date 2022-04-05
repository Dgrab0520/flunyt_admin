class TopCategoryModel {
  String categoryName;
  int count;

  TopCategoryModel({
    required this.categoryName,
    required this.count,
  });

  factory TopCategoryModel.fromJson(Map<String, dynamic> json) {
    return TopCategoryModel(
      count: json['count'] == null ? 0 : int.parse(json['count']),
      categoryName:
          json['categoryName'] == null ? "" : json['categoryName'] as String,
    );
  }
}
