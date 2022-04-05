class Client {
  int id;
  String clientId;
  String clientProfileImg;
  String clientCompany;
  String clientName;
  String clientPhone;
  DateTime registerDate;

  Client({
    required this.id,
    required this.clientId,
    required this.clientProfileImg,
    required this.clientCompany,
    required this.clientName,
    required this.clientPhone,
    required this.registerDate,
  });

  factory Client.fromJson(Map<String, dynamic> json) {
    return Client(
      id: json['id'] == null ? 0 : int.parse(json['id']),
      clientId: json['client_id'] == null ? "" : json['client_id'] as String,
      clientProfileImg: json['client_profile'] == null
          ? ""
          : json['client_profile'] as String,
      clientCompany:
          json['client_com'] == null ? "" : json['client_com'] as String,
      clientName: json['name'] == null ? "" : json['name'] as String,
      clientPhone: json['phone'] == null ? "" : json['phone'] as String,
      registerDate: json['register_date'] == null
          ? DateTime.now()
          : DateTime.parse(json['register_date']),
    );
  }
}
