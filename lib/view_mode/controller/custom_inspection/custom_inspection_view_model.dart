import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../../main.dart';
import '../../../model/custom_inspection/custom_inspection_model.dart';
import '../../../res/routes/routes_name.dart';
import '../../../utils/utils.dart';
import '../signin/signin_view_model.dart';

class CustomInspectionViewModel extends GetxController {
  final signInVM = Get.put(SignInViewModel());
  static  String apiUrl =
      'http://$baseUrl/api/get/custom/inspections';
  final apiResponse = Rx<CustomInspectionModel>(CustomInspectionModel(
    statusCode: 0,
    message: '',
    error: '',
    data: [],
  ));

  @override
  void onInit() {
    super.onInit();
    fetchData();
  }

  Future<void> fetchData() async {
    final String? getTooken = await signInVM.getBearerToken();
    final response = await http.get(
      Uri.parse(apiUrl),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${getTooken}'
      },
    );

    try {
      if (kDebugMode) {
        print(response.statusCode);
      }
      if (response.statusCode == 200) {
        apiResponse.value =
            CustomInspectionModel.fromJson(json.decode(response.body));
      } else if (response.statusCode == 401) {
        if (kDebugMode) {
          print(response.request);
        }
        Utils.snackBar("UnAuthorized ", "Logout");

        Get.toNamed(RouteName.signInView);
      } else {
        Utils.snackBar("Data Unauthenticated ", "Try Again");
      }
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
      Utils.snackBar("Exception ", e.toString());
    }
  }
}
