import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

import '../../../model/custom_inspection_detail/custom_inspection_detail_model.dart';

import '../../../res/routes/routes_name.dart';
import '../../../utils/utils.dart';
import '../signin/signin_view_model.dart';

class CustomInspectionDetailViewModel extends GetxController {
  final signInVM = Get.put(SignInViewModel());
  final String baseUrl = 'http://38.242.154.202/api';
  final Rx<CustomInspectionDetailModel> apiResponse =
      CustomInspectionDetailModel(
              statusCode: 0, message: 'Loading', data: [], error: '')
          .obs;

  Future<void> fetchInspectionDetails(int id) async {
    apiResponse.value = CustomInspectionDetailModel(
        statusCode: 0, message: 'Loading', data: [], error: '');
    final response = await http.get(
      Uri.parse('$baseUrl/get/custom/inspection/details/$id'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${signInVM.bearerToken}'
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
      apiResponse.value = CustomInspectionDetailModel(
          statusCode: 500, message: 'Error: $e', data: [], error: '');
    }
  }

  ///
//   Future<void> updateInspectionDetail(int id, String condition, String remark) async {
//     apiResponse.value = CustomInspectionSendingDetailModel(statusCode: 0, message: '', error: '', data: []) as CustomInspectionDetailModel;
//     try {
//       // final response = await http.post(
//       //   Uri.parse('$baseUrl/store/custom/inspection/details'),
//       //   headers: {
//       //     'Content-Type': 'application/json',
//       //     'Authorization': 'Bearer ${signInVM.bearerToken}'
//       //   },
//       //   body: json.encode({
//       //     'id': id,
//       //     'condition': condition,
//       //     'remark': remark
//       //   }),
//       // );
//       final dynamicData = {'id': id, 'condition': condition, 'remark': remark};
//       final Map<String, dynamic> jsonData = Map<String, dynamic>.from(dynamicData);
//       final response = await http.post(
//         Uri.parse('$baseUrl/store/custom/inspection/details'),
//         headers: {
//           'Content-Type': 'application/json',
//           'Authorization': 'Bearer ${signInVM.bearerToken}'
//         },
//         body: json.encode(jsonData),
//       );
//       if (response.statusCode == 200) {
//         final jsonData = jsonDecode(response.body);
//         dynamic data = jsonData['data'];
//         if (data is List) {
//           final List<CustomInspectionDetailData> questions = data.map((item) => CustomInspectionDetailData.fromJson(item)).toList();
//           apiResponse.value = CustomInspectionSendingDetailModel(
//             statusCode: 200,
//             message: 'Success',
//             data: questions,
//             error: '',
//           ) as CustomInspectionDetailModel;
//         } else if (data is Map) {
//           final CustomInspectionSendingDetailModel question = CustomInspectionSendingDetailModel.fromJson(data);
//           apiResponse.value = CustomInspectionSendingDetailModel(
//             statusCode: 200,
//             message: 'Success',
//             data: [question],
//             error: '',
//           ) as CustomInspectionDetailModel;
//         }
//         Utils.snackBar("Data Uploaded Successfully ", "Congratulations");
//         await Future.delayed(const Duration(milliseconds: 500)); // add a delay before showing the dialog
//         Get.defaultDialog(
//           title: "Status",
//           middleText: "Successfully Data Uploaded",
//           barrierDismissible: false,
//           confirm: ElevatedButton(
//             onPressed: () => Get.back(),
//             child: const Text("OK"),
//           ),
//         );
//       } else if (response.statusCode == 401) {
//         Utils.snackBar("UnAuthorized ", "Logout");
//         Get.toNamed(RouteName.signInView);
//       } else {
//         Utils.snackBar("Data Unauthenticated ", "Try Again");
//       }
//     } catch (e) {
//       if (kDebugMode) {
//         print(e.toString());
//       }
//       Utils.snackBar("Exception ", e.toString());
//       print("Exception ${e.toString()}");
//       apiResponse.value = CustomInspectionSendingDetailModel(
//         statusCode: 500,
//         message: 'Error: $e',
//         data: [],
//         error: '',
//       ) as CustomInspectionDetailModel;
//     }
//   }

  ///
  ///

  /// Sending Data without Model

  Future<void> updateInspectionDetail(
      List<Map<String, dynamic>> inspectionDetails) async {
    try {
      final response = await post(
          Uri.parse(
              'http://38.242.154.202/api/store/custom/inspection/details'),
          headers: {
            'Content-Type': 'application/json',
            'Authorization': 'Bearer ${signInVM.bearerToken}'
          },
          body: json.encode({'data': inspectionDetails}));

      var data = jsonDecode(response.body);
      if (kDebugMode) {
        print(response.statusCode);
      }
      if (kDebugMode) {
        print(response.body);
        print(data);
      }
      if (response.statusCode == 200) {
        Utils.snackBar("Data Uploaded Successfully ", "Congratulations");
        await Future.delayed(const Duration(
            milliseconds: 500)); // add a delay before showing the dialog
        Get.defaultDialog(
          title: "Status",
          middleText: "Successfully Data Uploaded",
          barrierDismissible: false,
          confirm: ElevatedButton(
            onPressed: () => Get.back(),
            child: const Text("OK"),
          ),
        );
        if (kDebugMode) {
          print(response.body);
        }
      } else if (response.statusCode == 401) {
        Utils.snackBar("UnAuthorized ", "Logout");
        Get.toNamed(RouteName.signInView);
      } else {
        Utils.snackBar("Data Unauthenticated ", "Try Again");
      }
    } catch (e) {
      if (kDebugMode) {
        print("Exception occur: ${e.toString()}");
      }
      // Handle the unexpected response format here
      Utils.snackBar("Error", "Unexpected response format. Please try again later.");
    }
  }

}
