class Sponsor {
  int id;
  String area;
  String serviceType;
  String title;
  String thumbnail;
  String contentImage;
  String content;
  String status;

  Sponsor({
    required this.id,
    required this.area,
    required this.serviceType,
    required this.title,
    required this.thumbnail,
    required this.contentImage,
    required this.content,
    required this.status,
  });

  factory Sponsor.fromJson(Map<String, dynamic> json) {
    return Sponsor(
      id: json['id'] == null ? 0 : int.parse(json['id']),
      area: json['area'] == null ? "" : json['area'] as String,
      serviceType:
          json['serviceType'] == null ? "" : json['serviceType'] as String,
      title: json['title'] == null ? "" : json['title'] as String,
      thumbnail: json['thumbnail'] == null ? "" : json['thumbnail'] as String,
      contentImage:
          json['contentImage'] == null ? "" : json['contentImage'] as String,
      content: json['content'] == null ? "" : json['content'] as String,
      status: json['status'] == null ? "" : json['status'] as String,
    );
  }
}
