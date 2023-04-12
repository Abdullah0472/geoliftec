class CustomInspectionDetailModel {
  int statusCode;
  String message;
  String error;
  List<CustomInspectionDetailData> data;

  CustomInspectionDetailModel({
    required this.statusCode,
    required this.message,
    required this.data,
    required this.error,
  });

  factory CustomInspectionDetailModel.fromJson(Map<String, dynamic> json) {
    return CustomInspectionDetailModel(
      statusCode: json['status_code'] ?? 0,
      message: json['message'] ?? '',
      error: json['error'] ?? '',
      data: (json['data'] as List)
          .map((item) => CustomInspectionDetailData.fromJson(item))
          .toList(),
    );
  }
}

class CustomInspectionDetailData {
  int id;
  String question;
  String condition;
  String remark;

  CustomInspectionDetailData({
    required this.id,
    required this.question,
    required this.condition,
    required this.remark,
  });

  factory CustomInspectionDetailData.fromJson(Map<String, dynamic> json) {
    return CustomInspectionDetailData(
      id: json['id'] ?? 0,
      question: json['question'] ?? '',
      condition: json['condition'] ?? '',
      remark: json['remark'] ?? '',
    );
  }
}
