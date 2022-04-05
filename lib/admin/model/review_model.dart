class Review {
  int id;
  int userId;
  String userName;
  String userProfileImg;
  int placeId;
  String placeName;
  String placeType;
  String placeAddress;
  String review;
  DateTime reviewDate;
  int heartCount;
  int saveCount;
  List<dynamic> images;
  List<dynamic> tags;

  Review({
    required this.id,
    required this.userId,
    required this.userName,
    required this.userProfileImg,
    required this.placeId,
    required this.placeName,
    required this.placeType,
    required this.placeAddress,
    required this.review,
    required this.reviewDate,
    required this.heartCount,
    required this.saveCount,
    required this.images,
    required this.tags,
  });

  factory Review.fromJson(Map<String, dynamic> json) {
    return Review(
      id: json['id'] == null ? 0 : int.parse(json['id']),
      userId: json['userId'] == null ? 0 : int.parse(json['userId']),
      userName: json['userName'] == null ? "" : json['userName'] as String,
      userProfileImg:
          json['profile_img'] == null ? "" : json['profile_img'] as String,
      placeId: json['placeId'] == null ? 0 : int.parse(json['placeId']),
      placeName: json['placeName'] == null ? "" : json['placeName'] as String,
      placeType:
          json['serviceType'] == null ? "" : json['serviceType'] as String,
      placeAddress: json['address'] == null ? "" : json['address'] as String,
      review: json['review'] == null ? "" : json['review'] as String,
      reviewDate: json['reviewDate'] == null
          ? DateTime.now()
          : DateTime.parse(json['reviewDate']),
      heartCount:
          json['heartCount'] == null ? 0 : int.parse(json['heartCount']),
      saveCount: json['saveCount'] == null ? 0 : int.parse(json['saveCount']),
      images: json['images'] ?? [],
      tags: json['tags'] ?? [],
    );
  }
}
