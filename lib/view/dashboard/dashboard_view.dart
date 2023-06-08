// ignore_for_file: unnecessary_null_comparison

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:geoliftec/model/dashboard/dashboard_model.dart';
import 'package:geoliftec/view_mode/controller/signin/signin_view_model.dart';
import 'package:get/get.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import '../../res/assets/images/images.dart';
import '../../res/colors/colors.dart';
import '../../res/components/widgets/container/dashboard_container_widget.dart';
import '../../view_mode/controller/dashboard/dashboard_view_model.dart';

class DashboardView extends StatelessWidget {
  DashboardView({Key? key}) : super(key: key);
  final dashboardVM = Get.put(DashboardViewModel());
  final signInVM = Get.find<SignInViewModel>();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<DataDashBoard>>(
        future: dashboardVM.fetchDashboardData(),
        builder: (BuildContext context,
            AsyncSnapshot<List<DataDashBoard>> snapshot) {
          //  AssetImage makeImage;
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasData && snapshot.data!.isNotEmpty) {
            List<DataDashBoard> profileList = snapshot.data!;
            DataDashBoard profileDetail = profileList[0];

            if (profileDetail != null) {
              return Scaffold(
                appBar: AppBar(
                  actions: [
                    Padding(
                      padding: EdgeInsets.only(top: 30),
                      child: Stack(
                        children: [
                          IconButton(
                              onPressed: () {
                                signInVM.buildLanguageDialog(context);
                              },
                              icon: const Icon(
                                MdiIcons.web,
                                size: 25,
                                color: AppColor.whiteColor,
                              )),
                          Positioned(
                              right: 15,
                              top: 35,
                              child: Text(
                                'changelang'.tr,
                                style: const TextStyle(
                                    color: AppColor.whiteColor,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500),
                              )),
                        ],
                      ),
                    ),
                    IconButton(
                        onPressed: () {
                          signInVM.logoutApi();
                        },
                        icon: const Icon(
                          MdiIcons.logout,
                          size: 25,
                          color: AppColor.whiteColor,
                        )),
                  ],
                  elevation: 0,
                  centerTitle: true,
                  automaticallyImplyLeading: false,
                  toolbarHeight: 110,
                  title: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Image.asset(
                          ImageAssets.geoliftec,
                          height: 90,
                          width: 150,
                        ),
                      ),
                    //   Padding(
                    //     padding: const EdgeInsets.only(bottom: 50),
                    //     child: Text(
                    //     "AppBarDashboardText".tr,
                    //     style: const TextStyle(
                    //       color: Colors.white,
                    //       fontSize: 28,
                    //       fontWeight: FontWeight.w500
                    //     ),
                    // ),
                    //   ),

                  ]
                  ),
                ),
                body: SafeArea(
                  child: Column(
                    children: [
                      const SizedBox(height: 20),
                      Center(
                        child: Image.asset(
                          ImageAssets.forkLifter,
                          height: 250,
                        ),
                      ),
                      Expanded(
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Obx(() {
                                    AssetImage makeImageAsset;
                                    if (signInVM
                                            .currentLocale.value.languageCode ==
                                        'es') {
                                      makeImageAsset = const AssetImage(
                                          ImageAssets.forkLifter_brand_sp);
                                    } else {
                                      makeImageAsset = const AssetImage(
                                          ImageAssets.forkLifter_brand);
                                    }
                                    return DashBoardContainerWidget(
                                      title: 'Make',
                                      subtitle: profileDetail.make,
                                      imageDisplay: makeImageAsset,
                                    );
                                  }),
                                  Obx(() {
                                    AssetImage makeImageAsset;
                                    if (signInVM
                                            .currentLocale.value.languageCode ==
                                        'es') {
                                      makeImageAsset = const AssetImage(
                                          ImageAssets.forkLifter_model_sp);
                                    } else {
                                      makeImageAsset = const AssetImage(
                                          ImageAssets.forkLifter_model);
                                    }
                                    return DashBoardContainerWidget(
                                      title: 'Model',
                                      subtitle: profileDetail.model,
                                      imageDisplay: makeImageAsset,
                                    );
                                  }),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Obx(() {
                                    AssetImage makeImageAsset;
                                    if (signInVM
                                            .currentLocale.value.languageCode ==
                                        'es') {
                                      makeImageAsset = const AssetImage(
                                          ImageAssets.forkLifter_reg_date_sp);
                                    } else {
                                      makeImageAsset = const AssetImage(
                                          ImageAssets.forkLifter_reg_date);
                                    }
                                    return DashBoardContainerWidget(
                                      title: 'Registration Data',
                                      subtitle: profileDetail.regDate,
                                      imageDisplay: makeImageAsset,
                                    );
                                  }),
                                  Obx(() {
                                    AssetImage makeImageAsset;
                                    if (signInVM
                                            .currentLocale.value.languageCode ==
                                        'es') {
                                      makeImageAsset = const AssetImage(
                                          ImageAssets.forkLifter_reg_num_sp);
                                    } else {
                                      makeImageAsset = const AssetImage(
                                          ImageAssets.forkLifter_reg_num);
                                    }
                                    return DashBoardContainerWidget(
                                      title: 'Registered Number',
                                      subtitle: profileDetail.regNo,
                                      imageDisplay: makeImageAsset,
                                    );
                                  }),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  DashBoardContainerWidget(
                                   // textPading: 45,
                                    title: 'WareHouse',
                                    subtitle: profileDetail.warehouse,
                                    imageDisplay:
                                        const AssetImage(ImageAssets.wareHouse),
                                  ),
                                  Obx(() {
                                    AssetImage makeImageAsset;
                                    if (signInVM
                                        .currentLocale.value.languageCode ==
                                        'es') {
                                      makeImageAsset = const AssetImage(
                                          ImageAssets.forklift_type_sp);
                                    } else {
                                      makeImageAsset = const AssetImage(
                                          ImageAssets.forklift_type);
                                    }
                                    return  DashBoardContainerWidget(
                                      title: 'Forklift Type',
                                      subtitle: profileDetail.electric == 0 ? "nonElectricText".tr : "electricText".tr,
                                      imageDisplay: makeImageAsset,
                                    );
                                  }),


                                ],
                              ),
                              const SizedBox(
                                height: 25,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            } else {
              return const Center(child: Text("Data is incorrect"));
            }
          } else if (snapshot.hasError) {
            return Center(
                child: Text("The Error in Dashboard : ${snapshot.error}"));
          } else {
            return const Center(child: Text("Please Wait"));
          }
        });
  }
}
