import 'package:flutter/material.dart';
import 'package:geoliftec/view/custom_inspection_detail/custom_inspection_detail_view.dart';
import 'package:geoliftec/view_mode/controller/custom_inspection/custom_inspection_view_model.dart';
import 'package:geoliftec/view_mode/controller/custom_inspection_detail/custom_inspection_detail_view_model.dart';
import 'package:get/get.dart';
import '../../res/colors/colors.dart';

class CustomInspectionView extends StatelessWidget {
  CustomInspectionView({Key? key}) : super(key: key);

  final CustomInspectionViewModel controller =
      Get.put(CustomInspectionViewModel());

  final CustomInspectionDetailViewModel inspectionController =
      Get.put(CustomInspectionDetailViewModel());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: AppColor.whiteColor,
        appBar: AppBar(
          backgroundColor: AppColor.appBarColor,
          elevation: 0,
          centerTitle: true,
          automaticallyImplyLeading: false,
          toolbarHeight: 80,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30))),
          title: const Text(
            "Custom Inspection",
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.w800, fontSize: 32),
          ),
        ),
        body: Center(
          child: Container(
            margin: const EdgeInsets.all(16),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              border: Border.all(color: AppColor.greyColor, width: 4),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Obx(() {
              final apiResponse = controller.apiResponse.value;
              if (apiResponse.statusCode == 200) {
                final data = apiResponse.data;
                if (data.isNotEmpty) {
                  return ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    itemCount: data.length,
                    itemBuilder: (context, index) {
                      return Card(
                        margin: const EdgeInsets.symmetric(vertical: 8),
                        child: InkWell(
                          onTap: () {
                            inspectionController
                                .fetchInspectionDetails(data[index].id);
                            Get.to(() =>
                                CustomInspectionDetailView(id: data[index].id));
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.shade300,
                                  blurRadius: 1.0,
                                  spreadRadius: 1.0,
                                  offset: const Offset(
                                    1.0,
                                    1.0,
                                  ),
                                )
                              ],
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(15)),
                              color: AppColor.dashboardContainerColor,
                            ),
                            padding: const EdgeInsets.all(16),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                const Text(
                                  'Inspection Due:',
                                  style: TextStyle(
                                    color: AppColor.redShadeColor,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 25,
                                  ),
                                ),
                                Text(
                                  data[index].createdAt,
                                  style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500,
                                      decoration: TextDecoration.underline),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  );
                } else {
                  return const Center(
                      child: Text(
                    "No Inspection Due",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w600,
                    ),
                  )); // Show "Data not found" text when data is empty
                }
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            }),

            ///======== StreamBuilder ========= ///
            // StreamBuilder(
            //     stream: controller
            //         .apiResponse.stream, // Stream to listen to for changes
            //     builder: (context, snapshot) {
            //       if (snapshot.connectionState == ConnectionState.waiting) {
            //         return const Center(child: CircularProgressIndicator());
            //       } else if (snapshot.hasError) {
            //         return const Center(child: Text('Error fetching data'));
            //       } else {
            //         final apiResponse = snapshot.data;
            //         if (apiResponse?.statusCode == 200) {
            //           final data = apiResponse?.data;
            //           if (data != null) {
            //             return ListView.builder(
            //               physics: const BouncingScrollPhysics(),
            //               scrollDirection: Axis.vertical,
            //               itemCount: data.length,
            //               itemBuilder: (context, index) {
            //                 return Card(
            //                   margin:
            //                       const EdgeInsets.symmetric(vertical: 8),
            //                   child: InkWell(
            //                     onTap: () {
            //                       inspectionController
            //                           .fetchInspectionDetails(
            //                               data[index].id);
            //                       Get.to(() => CustomInspectionDetailView(
            //                           id: data[index].id));
            //                     },
            //                     child: Container(
            //                       decoration: BoxDecoration(
            //                         boxShadow: [
            //                           BoxShadow(
            //                             color: Colors.grey.shade300,
            //                             blurRadius: 1.0,
            //                             spreadRadius: 1.0,
            //                             offset: const Offset(
            //                               1.0,
            //                               1.0,
            //                             ),
            //                           )
            //                         ],
            //                         borderRadius: const BorderRadius.all(
            //                             Radius.circular(15)),
            //                         color: AppColor.dashboardContainerColor,
            //                       ),
            //                       padding: const EdgeInsets.all(16),
            //                       child: Row(
            //                         crossAxisAlignment:
            //                             CrossAxisAlignment.center,
            //                         mainAxisAlignment:
            //                             MainAxisAlignment.spaceEvenly,
            //                         children: [
            //                           const Text(
            //                             'Inspection Due:',
            //                             style: TextStyle(
            //                               color: AppColor.redShadeColor,
            //                               fontWeight: FontWeight.bold,
            //                               fontSize: 25,
            //                             ),
            //                           ),
            //                           Text(
            //                             data[index].createdAt,
            //                             style: const TextStyle(
            //                                 fontSize: 20,
            //                                 fontWeight: FontWeight.w500,
            //                                 decoration:
            //                                     TextDecoration.underline),
            //                           ),
            //                         ],
            //                       ),
            //                     ),
            //                   ),
            //                 );
            //               },
            //             );
            //           } else {
            //             return const Center(
            //                 child: Text(
            //               "No Inspection Due",
            //               style: TextStyle(
            //                 fontSize: 22,
            //                 fontWeight: FontWeight.w600,
            //               ),
            //             )); // Show "Data not found" text when data is empty
            //           }
            //         } else {
            //           return const Center(
            //               child: CircularProgressIndicator());
            //         }
            //       }
            //     }),
          ),
        ));
  }
}
