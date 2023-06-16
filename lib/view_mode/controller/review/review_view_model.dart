import 'dart:convert';
import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import '../../../main.dart';
import '../../../res/routes/routes_name.dart';
import '../../../utils/utils.dart';
import '../signin/signin_view_model.dart';

class ReviewViewModel extends GetxController {
  final signInVM = Get.put(SignInViewModel());
  final radiatorController = TextEditingController().obs;
  final engineController = TextEditingController().obs;
  final hydraulicOilController = TextEditingController().obs;
  final brakeController = TextEditingController().obs;
  final batteryElectrolyteController = TextEditingController().obs;
  final fuelController = TextEditingController().obs;
  final leaksController = TextEditingController().obs;
  final mastChainController = TextEditingController().obs;
  final hydraulicDriveController = TextEditingController().obs;
  final hydraulicHosesController = TextEditingController().obs;
  final mirrorsController = TextEditingController().obs;
  final pedalsController = TextEditingController().obs;
  final tiresController = TextEditingController().obs;
  final forksController = TextEditingController().obs;
  final retroHornController = TextEditingController().obs;
  final flasherBeaconController = TextEditingController().obs;

  final radiatorFocusNode = FocusNode().obs;
  final engineFocusNode = FocusNode().obs;
  final hydraulicOilFocusNode = FocusNode().obs;
  final brakeFocusNode = FocusNode().obs;
  final batteryElectrolyteFocusNode = FocusNode().obs;
  final fuelFocusNode = FocusNode().obs;
  final leaksFocusNode = FocusNode().obs;
  final mastChainFocusNode = FocusNode().obs;
  final hydraulicDriveFocusNode = FocusNode().obs;
  final hydraulicHosesFocusNode = FocusNode().obs;
  final mirrorsFocusNode = FocusNode().obs;
  final pedalsFocusNode = FocusNode().obs;
  final tiresFocusNode = FocusNode().obs;
  final forksFocusNode = FocusNode().obs;
  final retroHornFocusNode = FocusNode().obs;
  final flasherBeaconFocusNode = FocusNode().obs;

  /// ----------------------- Drop Down Controller -------------------///

  final radiatorDropDownController = TextEditingController().obs;
  final engineDropDownController = TextEditingController().obs;
  final hydraulicOilDropDownController = TextEditingController().obs;
  final brakeDropDownController = TextEditingController().obs;
  final batteryElectrolyteDropDownController = TextEditingController().obs;
  final fuelDropDownController = TextEditingController().obs;
  final leaksDropDownController = TextEditingController().obs;
  final mastChainDropDownController = TextEditingController().obs;
  final hydraulicDriveDropDownController = TextEditingController().obs;
  final hydraulicHosesDropDownController = TextEditingController().obs;
  final mirrorsDropDownController = TextEditingController().obs;
  final pedalsDropDownController = TextEditingController().obs;
  final tiresDropDownController = TextEditingController().obs;
  final forksDropDownController = TextEditingController().obs;
  final retroHornDropDownController = TextEditingController().obs;
  final flasherBeaconDropDownController = TextEditingController().obs;

  final radiatorDropDownFocusNode = FocusNode().obs;
  final engineDropDownFocusNode = FocusNode().obs;
  final hydraulicOilDropDownFocusNode = FocusNode().obs;
  final brakeDropDownFocusNode = FocusNode().obs;
  final batteryElectrolyteDropDownFocusNode = FocusNode().obs;
  final fuelDropDownFocusNode = FocusNode().obs;
  final leaksDropDownFocusNode = FocusNode().obs;
  final mastChainDropDownFocusNode = FocusNode().obs;
  final hydraulicDriveDropDownFocusNode = FocusNode().obs;
  final hydraulicHosesDropDownFocusNode = FocusNode().obs;
  final mirrorsDropDownFocusNode = FocusNode().obs;
  final pedalsDropDownFocusNode = FocusNode().obs;
  final tiresDropDownFocusNode = FocusNode().obs;
  final forksDropDownFocusNode = FocusNode().obs;
  final retroHornDropDownFocusNode = FocusNode().obs;
  final flasherBeaconDropDownFocusNode = FocusNode().obs;

  String? groupValue;
  RxDouble radioSize = 150.0.obs;
  Future<int> inspection() async {
    try {

      Get.dialog(
        WillPopScope(
            child: const Center(child: CupertinoActivityIndicator()),
            onWillPop: () async {
              return false;
            }),
        barrierDismissible: true,
      );
    // Close the dialog

      final String? getTooken = await signInVM.getBearerToken();
      log({
        'radiator_level': radiatorDropDownController.value.text,
        'engine_oil': engineDropDownController.value.text,
        'hydraulic_oil': hydraulicOilDropDownController.value.text,
        'brake_fluid': brakeDropDownController.value.text,
        'battery_electrolyte': batteryElectrolyteDropDownController.value.text,
        'fuel': fuelDropDownController.value.text,
        'Leaks': leaksDropDownController.value.text,
        'mast_chains': mastChainDropDownController.value.text,
        'hydraulic_drive': hydraulicDriveDropDownController.value.text,
        'hydraulic_hoses': hydraulicHosesDropDownController.value.text,
        'mirrors': mirrorsDropDownController.value.text,
        'pedals': pedalsDropDownController.value.text,
        'tires': tiresDropDownController.value.text,
        'forks': forksDropDownController.value.text,
        'retro_horn': retroHornDropDownController.value.text,
        'flasher_beacon': flasherBeaconDropDownController.value.text,
      }.toString());
      final response = await post(Uri.parse('http://$baseUrl/api/inspection'),
          headers: {
            'Content-Type': 'application/json',
            'Authorization': 'Bearer $getTooken'
          },
          body: json.encode({
            /// -----------------Passing Remarks Data ---------------- ///
            'radiator_level_remark': radiatorController.value.text,
            'engine_oil_remark': engineController.value.text,
            'hydraulic_oil_remark': hydraulicOilController.value.text,
            'brake_fluid_remark': brakeController.value.text,
            'battery_electrolyte_remark':
                batteryElectrolyteController.value.text,
            'fuel_remark': fuelController.value.text,
            'Leaks_remark': leaksController.value.text,
            'mast_chains_remark': mastChainController.value.text,
            'hydraulic_drive_remark': hydraulicDriveController.value.text,
            'hydraulic_hoses_remark': hydraulicHosesController.value.text,
            'mirrors_remark': mirrorsController.value.text,
            'pedals_remark': pedalsController.value.text,
            'tires_remark': tiresController.value.text,
            'forks_remark': forksController.value.text,
            'retro_horn_remark': retroHornController.value.text,
            'flasher_beacon_remark': flasherBeaconController.value.text,

            ///---------- Passing DropDown data --------- ///

            'radiator_level': radiatorDropDownController.value.text,
            'engine_oil': engineDropDownController.value.text,
            'hydraulic_oil': hydraulicOilDropDownController.value.text,
            'brake_fluid': brakeDropDownController.value.text,
            'battery_electrolyte':
                batteryElectrolyteDropDownController.value.text,
            'fuel': fuelDropDownController.value.text,
            'Leaks': leaksDropDownController.value.text,
            'mast_chains': mastChainDropDownController.value.text,
            'hydraulic_drive': hydraulicDriveDropDownController.value.text,
            'hydraulic_hoses': hydraulicHosesDropDownController.value.text,
            'mirrors': mirrorsDropDownController.value.text,
            'pedals': pedalsDropDownController.value.text,
            'tires': tiresDropDownController.value.text,
            'forks': forksDropDownController.value.text,
            'retro_horn': retroHornDropDownController.value.text,
            'flasher_beacon': flasherBeaconDropDownController.value.text,
          }));

      if (response.statusCode == 200) {
        Utils.snackBar("dataUploadSuccess".tr, "congoText".tr);
        await Future.delayed(const Duration(
            milliseconds: 500)); // add a delay before showing the dialog
        Get.defaultDialog(
          title: "statusText".tr,
          middleText: "dataUploadSuccess".tr,
          barrierDismissible: false,
          confirm: ElevatedButton(
            onPressed: () => Get.close(2),
            child:  Text("okText".tr),
          ),
        );

        // Clear the groupValue here
        groupValue = null;

        print("After Sending data successfully the data is ${response.body}");
      }
      else if (response.statusCode == 401) {
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
      }

      else {
        print("The Status Code before sending data: ${response.statusCode}");
        print("The Response Body before sending data: ${response.body}");
        Utils.snackBar("dataUnauthenticatedText".tr, "tryAgainText".tr);
        Get.dialog(
          WillPopScope(
              child: const Center(child: CupertinoActivityIndicator()),
              onWillPop: () async {
                return false;
              }),
          barrierDismissible: false,
        );

        await Future.delayed(const Duration(seconds: 2)); // Delay for 2 seconds

        Get.back(); // Close the dialog
        signInVM.logoutApi();
         //Get.offAllNamed(RouteName.signInView);
      }
      return response.statusCode;
    }
    catch (e) {
      print("The Exception During Sending Inspection Report ${e.toString()}");
      Utils.snackBar("Exception ", e.toString());
      Get.dialog(
        WillPopScope(
            child: const Center(child: CupertinoActivityIndicator()),
            onWillPop: () async {
              return false;
            }),
        barrierDismissible: false,
      );

      await Future.delayed(const Duration(seconds: 2)); // Delay for 2 seconds

      Get.back(); // Close the dialog
      signInVM.logoutApi();
     // Get.offAllNamed(RouteName.signInView);
      rethrow;
    }
  }
}
