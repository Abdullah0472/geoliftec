class ProfileModel {
  ProfileModel({
    required this.statusCode,
    required this.message,
    required this.error,
    required this.data,
  });
  late final int statusCode;
  late final String message;
  late final String error;
  late final Data data;

  ProfileModel.fromJson(Map<String, dynamic> json){
    statusCode = int.parse(json['status_code'] ?? "0");
    message = json['message'] ?? "";
    error = json['error'] ?? "";
    data = Data.fromJson(json['data']??{});
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

class Data {
  Data({
    required this.name,
    required this.address,
    required this.email,
    required this.phone,
    required this.dateOfJoining,
    required this.trainingCertificate,
    required this.license,
    required this.ibuttonKey,
    required this.image,
  });
  late final String name;
  late final String address;
  late final String email;
  late final String phone;
  late final String dateOfJoining;
  late final String trainingCertificate;
  late final String license;
  late final String ibuttonKey;
  late final String image;

  Data.fromJson(Map<String, dynamic> json){
    name = json['name'] ??"";
    address = json['address'] ??"";
    email = json['email'] ??"";
    phone = json['phone'] ??"";
    dateOfJoining = json['date_of_joining'] ??"";
    trainingCertificate = json['training_certificate'] ??"";
    license =json['license'] ??"";
    ibuttonKey = json['ibutton_key'] ??"";
    image = json['image'] ??"";
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['name'] = name;
    _data['address'] = address;
    _data['email'] = email;
    _data['phone'] = phone;
    _data['date_of_joining'] = dateOfJoining;
    _data['training_certificate'] = trainingCertificate;
    _data['license'] = license;
    _data['ibutton_key'] = ibuttonKey;
    _data['image'] = image;
    return _data;
  }
}

