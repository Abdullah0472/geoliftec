class CustomInspectionSendingDetailModel {
  CustomInspectionSendingDetailModel({
    required this.statusCode,
    required this.message,
    required this.error,
    required this.data,
  });
  late final int statusCode;
  late final String message;
  late final String error;
  late final List<dynamic> data;

  CustomInspectionSendingDetailModel.fromJson(Map<String, dynamic> json){
    statusCode = json['status_code'];
    message = json['message'];
    error = json['error'];
    data = List.castFrom<dynamic, dynamic>(json['data']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['status_code'] = statusCode;
    _data['message'] = message;
    _data['error'] = error;
    _data['data'] = data;
    return _data;
  }
}