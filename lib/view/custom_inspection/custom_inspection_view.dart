import 'package:flutter/material.dart';
import 'package:geoliftec/view/custom_inspection_detail/custom_inspection_detail_view.dart';
import 'package:geoliftec/view_mode/controller/custom_inspection/custom_inspection_view_model.dart';
import 'package:geoliftec/view_mode/controller/custom_inspection_detail/custom_inspection_detail_view_model.dart';
import 'package:geoliftec/view_mode/controller/review/review_view_model.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import '../../res/assets/images/images.dart';
import '../../res/colors/colors.dart';

class CustomInspectionView extends StatelessWidget {
  CustomInspectionView({Key? key}) : super(key: key);
  final reviewVM = Get.put(ReviewViewModel());

  @override
  Widget build(BuildContext context) {
    return Scaffold(

        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          centerTitle: true,
          automaticallyImplyLeading: false,
          toolbarHeight: 110,
          title:  Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Image.asset(
                    ImageAssets.geoliftec,
                    height: 90,
                    width: 150,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 50),
                  child: Text(
                    "AppBarCustomInspectionText".tr,
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 28,
                        fontWeight: FontWeight.w500
                    ),
                  ),
                ),

              ]
          ),
        ),

        body: GetBuilder<CustomInspectionViewModel>(
            init: CustomInspectionViewModel(),
            builder: (controller) {
              reviewVM.groupValue = null;
              return GetBuilder<CustomInspectionDetailViewModel>(
                  init: CustomInspectionDetailViewModel(),
                  builder: (inspectionController) {
                    return SmartRefresher(
                      controller: controller.refreshController,
                      onRefresh: () async {
                        await controller.fetchData();
                        controller.refreshController.refreshCompleted();
                      },
                      child: Center(
                        child: Container(
                          padding: const EdgeInsets.all(16),
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
                                    return Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 8),
                                      child: InkWell(
                                        onTap: () {
                                          inspectionController
                                              .fetchInspectionDetails(
                                                  data[index].id);
                                          Get.to(() =>
                                              CustomInspectionDetailView(
                                                  id: data[index].id));
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
                                                const BorderRadius.all(
                                                    Radius.circular(15)),
                                            color: AppColor
                                                .dashboardContainerColor,
                                          ),
                                          padding: const EdgeInsets.all(16),
                                          child: Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                               Text(
                                                'inspectionDueText'.tr,
                                                style: const TextStyle(
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
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                );
                              } else {
                                return  Center(
                                    child: Text(
                                  "noInspectionDueText".tr,
                                  style: const TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.w600,
                                  ),
                                )); // Show "Data not found" text when data is empty
                              }
                            } else {
                              return const Center(
                                  child: CircularProgressIndicator());
                            }
                          }),

                        ),
                      ),
                    );
                  });
            }));
  }
}
