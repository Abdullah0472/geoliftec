import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:geoliftec/res/components/widgets/card/card_design_due_inspection.dart';
import 'package:geoliftec/utils/utils.dart';
import 'package:geoliftec/view_mode/controller/custom_inspection_detail/custom_inspection_detail_view_model.dart';
import 'package:geoliftec/view_mode/controller/review/review_view_model.dart';
import 'package:get/get.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import '../../res/colors/colors.dart';
import '../../res/components/widgets/buttons/round_button_widget.dart';
import '../../view_mode/controller/custom_inspection/custom_inspection_view_model.dart';

class CustomInspectionDetailView extends StatelessWidget {
  final int id;
  final formKey = GlobalKey<FormState>();
  CustomInspectionDetailView({Key? key, required this.id}) : super(key: key);
  final CustomInspectionViewModel customInspectionController = Get.put(CustomInspectionViewModel());
  final reviewVM = Get.put(ReviewViewModel());
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(onPressed: (){
          reviewVM.groupValue = null;
          Get.back();
        },
        icon: Icon(MdiIcons.arrowLeft,size: 30,),),
        elevation: 0,
        centerTitle: true,
        toolbarHeight: 110,
        title:  Text(
          "dueInspectionReport".tr,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 25,
          ),
        ),
      ),
      body: SafeArea(
        child: Form(
          key: formKey,
          child: GetX<CustomInspectionDetailViewModel>(
            builder: (controller) {
              if (controller.apiResponse.value.statusCode == 200) {
                final data = controller.apiResponse.value.data;
                final textControllers = List.generate(
                  data.length,
                  (_) => TextEditingController(),
                );
                final dropDownControllers = List.generate(
                  data.length,
                  (_) => TextEditingController(),
                );
                return Column(
                  children: [
                    Expanded(
                      child: ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        itemCount: data.length,
                        itemBuilder: (context, index) {
                          return CardDesignDueInspection(
                            title: data[index].question,
                            title1: data[index].question,
                            icons: MdiIcons.commentQuestion,
                            controller: textControllers[index],
                            radioController: dropDownControllers[index],
                          );
                        },
                      ),
                    ),
                    RoundButton(
                      buttonColor: AppColor.buttonColor,
                      width: Get.width,
                      height: Get.height * 0.07,
                      // onPress: () async {
                      //   if (reviewVM.groupValue != null) {
                      //     List<Map<String, dynamic>> inspectionDetails = [];
                      //     for (int i = 0; i < data.length; i++) {
                      //       Map<String, dynamic> detail = {
                      //         'id': data[i].id,
                      //         'condition': dropDownControllers[i].text,
                      //         'remark': textControllers[i].text
                      //       };
                      //       inspectionDetails.add(detail);
                      //     }
                      //     try {
                      //       await controller.updateInspectionDetail(inspectionDetails);
                      //       for (var controller in dropDownControllers) {
                      //         controller.clear();
                      //       } // Clear drop-down controllers
                      //       for (var controller in textControllers) {
                      //         controller.clear();
                      //       }
                      //       await customInspectionController.fetchData();
                      //     } catch (e) {
                      //       // Handle the exception here
                      //       if (kDebugMode) {
                      //         print('Error Custom Inspection Due Screen : $e');
                      //       }
                      //       // Show an error message or take appropriate action
                      //     } // Navigate to CustomInspectionView
                      //   }
                      //   else{
                      //     Utils.snackBar("dataUploadUnSuccess".tr, "tryAgainText".tr);
                      //     await Future.delayed(const Duration(
                      //         milliseconds: 500)); // add a delay before showing the dialog
                      //     reviewVM.groupValue = null;
                      //   }
                      //
                      // },

                      onPress: () async {
                        if (reviewVM.groupValue != null) {
                          // Validation check
                          for (var controller in dropDownControllers) {
                            if (controller.text.isEmpty) {
                              Utils.snackBar("selectOptionText".tr, "tryAgainText".tr);
                              return;
                            }
                          }
                          List<Map<String, dynamic>> inspectionDetails = [];
                          for (int i = 0; i < data.length; i++) {
                            Map<String, dynamic> detail = {
                              'id': data[i].id,
                              'condition': dropDownControllers[i].text,
                              'remark': textControllers[i].text
                            };
                            inspectionDetails.add(detail);
                          }
                          try {
                            await controller.updateInspectionDetail(inspectionDetails);
                            for (var controller in dropDownControllers) {
                              controller.clear();
                            } // Clear drop-down controllers
                            for (var controller in textControllers) {
                              controller.clear();
                            }
                            await customInspectionController.fetchData();
                          } catch (e) {
                            // Handle the exception here
                            if (kDebugMode) {
                              print('Error Custom Inspection Due Screen : $e');
                            }
                            // Show an error message or take appropriate action
                          } // Navigate to CustomInspectionView
                        }
                        else {
                          Utils.snackBar("dataUploadUnSuccess".tr, "tryAgainText".tr);
                          await Future.delayed(const Duration(
                              milliseconds: 500)); // add a delay before showing the dialog
                          reviewVM.groupValue = null;
                        }
                      },

                      title: "reviewButtonText".tr,
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                  ],
                );
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            },
          ),
        ),
      ),
    );
  }
}
