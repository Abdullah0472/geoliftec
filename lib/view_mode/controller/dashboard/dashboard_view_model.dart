
import 'package:geoliftec/main.dart';
import 'package:geoliftec/model/dashboard/dashboard_model.dart';
import 'package:get/get.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../../res/routes/routes_name.dart';
import '../../../utils/utils.dart';
import '../signin/signin_view_model.dart';

class DashboardViewModel extends GetxController {
  final signInVM = Get.put(SignInViewModel());

  Future<List<DataDashBoard>> fetchDashboardData() async {
    final String? getTooken = await signInVM.getBearerToken();

    final response = await http.get(
      Uri.parse('http://$baseUrl/api/dashboard'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $getTooken'
      },
    );
    try {
      if (response.statusCode == 200) {
        final jsonResponse = json.decode(response.body);
        if (jsonResponse['data'] is Map<String, dynamic>) {
          final data = jsonResponse['data'] as Map<String, dynamic>;
          final profile = DataDashBoard.fromJson(data);
          return [profile];
        } else if (jsonResponse['data'] is List) {
          final data = jsonResponse['data'] as List;
          final profiles =
          data.map((json) => DataDashBoard.fromJson(json)).toList();
          return profiles;
        } else {
          Utils.snackBar("Data format is incorrect", "Try Again");
        }
      }
      else if (response.statusCode == 401) {
        Utils.snackBar("UnAuthorized ", "Logout");
        Get.toNamed(RouteName.signInView);
      } else {
        Utils.snackBar("Data Unauthenticated ", "Try Again");
      }
    } catch (e) {

      Utils.snackBar("Exception ", e.toString());
    }
    return [];
  }
}
