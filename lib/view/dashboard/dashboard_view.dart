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
  final signInVM = Get.put(SignInViewModel());
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<DataDashBoard>>(
        future: dashboardVM.fetchDashboardData(),
        builder: (BuildContext context,
            AsyncSnapshot<List<DataDashBoard>> snapshot) {
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
                    IconButton(
                        onPressed: () {
                          signInVM.logoutApi();
                        },
                        icon: const Icon(
                          MdiIcons.logout,
                          size: 25,
                          color: AppColor.whiteColor,
                        ))
                  ],
                  elevation: 0,
                  centerTitle: true,
                  automaticallyImplyLeading: false,
                  toolbarHeight: 80,
                  title: const Text(
                    "Dashboard",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                    ),
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
                                  DashBoardContainerWidget(
                                    title: 'Make',
                                    subtitle: profileDetail.make,
                                    imageDisplay: const AssetImage(
                                        ImageAssets.forkLifter_brand),
                                  ),
                                  DashBoardContainerWidget(
                                      title: 'Model',
                                      subtitle: profileDetail.model,
                                      imageDisplay: const AssetImage(
                                          ImageAssets.forkLifter_model)),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  DashBoardContainerWidget(
                                    title: 'Registration Data',
                                    subtitle: profileDetail.regDate,
                                    imageDisplay: const AssetImage(
                                        ImageAssets.forkLifter_reg_date),
                                  ),
                                  DashBoardContainerWidget(
                                      title: 'Registered Number',
                                      subtitle: profileDetail.regNo,
                                      imageDisplay: const AssetImage(
                                          ImageAssets.forkLifter_reg_num)),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  DashBoardContainerWidget(
                                    textPading: 45,
                                    title: 'WareHouse',
                                    subtitle: profileDetail.warehouse,
                                    imageDisplay:
                                        const AssetImage(ImageAssets.wareHouse),
                                  ),
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
