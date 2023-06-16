class DashboardModel {
  DashboardModel({
    required this.statusCode,
    required this.message,
    required this.error,
    required this.data,
  });
  late final int statusCode;
  late final String message;
  late final String error;
  late final DataDashBoard data;

  DashboardModel.fromJson(Map<String, dynamic> json){
    statusCode = json['status_code']??"";
    message = json['message']??"";
    error = json['error']??"";
    data = DataDashBoard.fromJson(json['data']??{});
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['status_code'] = statusCode;
    _data['message'] = message;
    _data['error'] = error;
    _data['data'] = data.toJson();
    return _data;
  }
}

class DataDashBoard {
  DataDashBoard({
    required this.make,
    required this.model,
    required this.regDate,
    required this.regNo,
    required this.warehouse,
    required this.electric,
    required this.company,
    required this.serie,
  });
  late final String make;
  late final String model;
  late final String regDate;
  late final String regNo;
  late final String warehouse;
  late final int electric;
  late final String? company;
  late final String? serie;

  DataDashBoard.fromJson(Map<String, dynamic> json){
    make = json['make']??"";
    model = json['model']??"";
    regDate = json['reg_date']??"";
    regNo = json['reg_no']??"";
    warehouse = json['warehouse']??"";
    electric = json['electric'] ?? 0;
    company = json['company'] ?? "";
    serie = json['serie'] ?? "no data found";
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['make'] = make;
    _data['model'] = model;
    _data['reg_date'] = regDate;
    _data['reg_no'] = regNo;
    _data['warehouse'] = warehouse;
    _data['electric'] = electric;
    _data['company'] = company;
    _data['serie'] = serie;
    return _data;
  }
}