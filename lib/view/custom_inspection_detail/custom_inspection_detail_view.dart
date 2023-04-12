import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:geoliftec/res/components/widgets/card/card_design_due_inspection.dart';
import 'package:geoliftec/res/routes/routes_name.dart';
import 'package:geoliftec/view/bottomNavigationBar/bottomNavigationBar_view.dart';

import 'package:geoliftec/view_mode/controller/custom_inspection_detail/custom_inspection_detail_view_model.dart';
import 'package:get/get.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import '../../res/colors/colors.dart';
import '../../res/components/widgets/buttons/round_button_widget.dart';

import '../../view_mode/controller/custom_inspection/custom_inspection_view_model.dart';
import '../custom_inspection/custom_inspection_view.dart';


class CustomInspectionDetailView extends StatelessWidget {
  final int id;
  final formKey = GlobalKey<FormState>();
  CustomInspectionDetailView({Key? key, required this.id}) : super(key: key);
  final CustomInspectionViewModel customInspectionController =
  Get.put(CustomInspectionViewModel());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.appBarColor,
        elevation: 0,
        centerTitle: true,
        automaticallyImplyLeading: false,
        toolbarHeight: 80,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(30),
            bottomRight: Radius.circular(30),
          ),
        ),
        title: const Text(
          "Due Inspection Report",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w800,
            fontSize: 32,
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
                        itemCount: data.length,
                        itemBuilder: (context, index) {
                          return CardDesignDueInspection(
                            hintFontSize: 15,
                            title: data[index].question,
                            title1: data[index].question,
                            icons: MdiIcons.commentQuestion,
                            controller: textControllers[index],
                            dropDownController: dropDownControllers[index],
                          );
                        },
                      ),
                    ),
                    RoundButton(
                      buttonColor: AppColor.appBarColor,
                      width: Get.width,
                      height: Get.height * 0.07,
                      onPress: () async {
                        if (formKey.currentState!.validate()) {
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
                            //   Get.back();
                            // Get.off(() => BottomNavigationBarView());

                          } catch (e) {
                            // Handle the exception here
                            if (kDebugMode) {
                              print('Error: $e');
                            }
                            // Show an error message or take appropriate action
                          }// Navigate to CustomInspectionView
                        }
                      },
                      title: "All Checked",
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
