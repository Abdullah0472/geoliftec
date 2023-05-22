import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:pull_to_refresh/pull_to_refresh.dart';
import '../../../main.dart';
import '../../../model/custom_inspection/custom_inspection_model.dart';
import '../../../res/routes/routes_name.dart';
import '../../../utils/utils.dart';
import '../signin/signin_view_model.dart';

class CustomInspectionViewModel extends GetxController {
  final signInVM = Get.put(SignInViewModel());
  RefreshController refreshController = RefreshController();
  static String apiUrl = 'http://$baseUrl/api/get/custom/inspections';
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
        'Authorization': 'Bearer $getTooken'
      },
    );

    try {
      if (response.statusCode == 200) {
        apiResponse.value = CustomInspectionModel.fromJson(json.decode(response.body));
      } else if (response.statusCode == 401) {
        Utils.snackBar("dataUnauthenticatedText".tr, "logoutText".tr);
        Get.toNamed(RouteName.signInView);
      } else {
        Utils.snackBar("dataUnauthenticatedText".tr, "tryAgainText".tr);
      }
    } catch (e) {
      Utils.snackBar("Exception ", e.toString());
    }
  }
}
