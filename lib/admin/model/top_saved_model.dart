class TopSavedModel {
  String placeName;
  int count;

  TopSavedModel({
    required this.placeName,
    required this.count,
  });

  factory TopSavedModel.fromJson(Map<String, dynamic> json) {
    return TopSavedModel(
      count: json['count'] == null ? 0 : int.parse(json['count']),
      placeName: json['placeName'] == null ? "" : json['placeName'] as String,
    );
  }
}
