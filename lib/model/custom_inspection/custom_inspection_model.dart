class CustomInspectionModel {
  int statusCode;
  String message;
  String error;
  List<CustomInspectionData> data;

  CustomInspectionModel({
    required this.statusCode,
    required this.message,
    required this.error,
    required this.data,
  });

  factory CustomInspectionModel.fromJson(Map<String, dynamic> json) {
    return CustomInspectionModel(
      statusCode: json['status_code']??"",
      message: json['message']??"",
      error: json['error']??"",
      data: (json['data'] as List)
          .map((item) => CustomInspectionData.fromJson(item))
          .toList(),
    );
  }
}

class CustomInspectionData {
  int id;
  String createdAt;

  CustomInspectionData({required this.id, required this.createdAt});

  factory CustomInspectionData.fromJson(Map<String, dynamic> json) {
    return CustomInspectionData(
      id: json['id']??"",
      createdAt: json['created_at']??"",
    );
  }
}
