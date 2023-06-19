import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geoliftec/main.dart';
import 'package:geoliftec/view_mode/controller/review/review_view_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import '../../../model/custom_inspection_detail/custom_inspection_detail_model.dart';
import '../../../res/routes/routes_name.dart';
import '../../../utils/utils.dart';
import '../signin/signin_view_model.dart';

class CustomInspectionDetailViewModel extends GetxController {

  final signInVM = Get.put(SignInViewModel());
  final reviewVM = Get.put(ReviewViewModel());

  final String baseurl = 'http://$baseUrl/api';
  final Rx<CustomInspectionDetailModel> apiResponse =
      CustomInspectionDetailModel(
              statusCode: 0, message: 'Loading', data: [], error: '')
          .obs;

  Future<void> fetchInspectionDetails(int id) async {
    final String? getTooken = await signInVM.getBearerToken();
    apiResponse.value = CustomInspectionDetailModel(
        statusCode: 0, message: 'Loading', data: [], error: '');
    final response = await http.get(
      Uri.parse('$baseurl/get/custom/inspection/details/$id'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $getTooken'
      },
    );
    try {
      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body);
        final List<dynamic> data = jsonData['data'];
        final List<CustomInspectionDetailData> questions = data
            .map((item) => CustomInspectionDetailData.fromJson(item))
            .toList();
        apiResponse.value = CustomInspectionDetailModel(
            statusCode: 200, message: 'Success', data: questions, error: '');
      } else if (response.statusCode == 401) {
        Utils.snackBar("dataUnauthenticatedText".tr, "logoutText".tr);
        Get.toNamed(RouteName.signInView);
      } else {
        Utils.snackBar("dataUnauthenticatedText".tr, "tryAgainText".tr);
      }
    } catch (e) {
      Utils.snackBar("Exception ", e.toString());
      apiResponse.value = CustomInspectionDetailModel(
          statusCode: 500, message: 'Error: $e', data: [], error: '');
    }
  }


  ///======================= Sending Data without Model ================== ///
  Future<void> updateInspectionDetail(
      List<Map<String, dynamic>> inspectionDetails) async {
    final String? getTooken = await signInVM.getBearerToken();

    try {
      Get.dialog(
        WillPopScope(
            child: const Center(child: CupertinoActivityIndicator()),
            onWillPop: () async {
              return false;
            }),
        barrierDismissible: true,
      );
      final response = await post(
          Uri.parse('http://$baseUrl/api/store/custom/inspection/details'),
          headers: {
            'Content-Type': 'application/json',
            'Authorization': 'Bearer $getTooken'
          },
          body: json.encode({'data': inspectionDetails}));

      if (response.statusCode == 200) {
        Utils.snackBar("dataUploadSuccess".tr, "congoText".tr);
        await Future.delayed(const Duration(
            milliseconds: 500)); // add a delay before showing the dialog

        Get.defaultDialog(
          title: "statusText".tr,
          middleText: "dataUploadSuccess".tr,
          barrierDismissible: false,
          confirm: ElevatedButton(
            onPressed: () {
             Get.close(3);
            },
            child: const Text("OK"),
          ),
        );
        reviewVM.groupValue = null;
      } else if (response.statusCode == 401) {
        reviewVM.groupValue = null;
        Utils.snackBar("dataUnauthenticatedText".tr, "logoutText".tr);
        Get.dialog(
          WillPopScope(
              child: const Center(child: CupertinoActivityIndicator()),
              onWillPop: () async {
                return false;
              }),
          barrierDismissible: false,
        );

        Future.delayed(const Duration(seconds: 5), () {
          if (Get.isDialogOpen ?? false) { // if dialog is currently open
            Get.back(); // it will close the dialog
            signInVM.logoutApi();
            //  Get.offAllNamed(RouteName.signInView); // navigate after closing the dialog
          }

        });
      } else {
        reviewVM.groupValue = null;
        Utils.snackBar("dataUnauthenticatedText".tr, "tryAgainText".tr);
        Get.dialog(
          WillPopScope(
              child: const Center(child: CupertinoActivityIndicator()),
              onWillPop: () async {
                return false;
              }),
          barrierDismissible: false,
        );

        Future.delayed(const Duration(seconds: 5), () {
          if (Get.isDialogOpen ?? false) { // if dialog is currently open
            Get.back(); // it will close the dialog
            signInVM.logoutApi();
            //  Get.offAllNamed(RouteName.signInView); // navigate after closing the dialog
          }

        });
      }
    } catch (e) {
      reviewVM.groupValue = null;
      // Handle the unexpected response format here
      Utils.snackBar(
          "Error", "Unexpected response format. Please try again later.");
      Get.dialog(
        WillPopScope(
            child: const Center(child: CupertinoActivityIndicator()),
            onWillPop: () async {
              return false;
            }),
        barrierDismissible: false,
      );

      Future.delayed(const Duration(seconds: 5), () {
        if (Get.isDialogOpen ?? false) { // if dialog is currently open
          Get.back(); // it will close the dialog
          signInVM.logoutApi();
          //  Get.offAllNamed(RouteName.signInView); // navigate after closing the dialog
        }

      });
    }
  }

  ///======================= Sending Data without Model ================== ///
}
