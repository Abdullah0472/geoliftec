// ignore_for_file: unnecessary_null_comparison

import 'package:flutter/material.dart';
import 'package:geoliftec/model/dashboard/dashboard_model.dart';
import 'package:geoliftec/model/profile/profile_model.dart';
import 'package:geoliftec/view_mode/controller/profile/profile_view_model.dart';
import 'package:geoliftec/view_mode/controller/signin/signin_view_model.dart';
import 'package:get/get.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import '../../res/assets/images/images.dart';
import '../../res/colors/colors.dart';
import '../../view_mode/controller/dashboard/dashboard_view_model.dart';

class DashboardView extends StatelessWidget {
  DashboardView({Key? key}) : super(key: key);
  final dashboardVM = Get.put(DashboardViewModel());
  final signInVM = Get.find<SignInViewModel>();
  final profileVM = Get.put(ProfileViewModel());

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
                      padding: const EdgeInsets.only(top: 30),
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
                      ]),
                ),
                body: SafeArea(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(height: 40),
                      FutureBuilder<List<Data>>(
                          future: profileVM.fetchProfileData(),
                          builder: (BuildContext context,
                              AsyncSnapshot<List<Data>> snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return const Center(
                                child: CircularProgressIndicator(),
                              );
                            } else if (snapshot.hasData &&
                                snapshot.data!.isNotEmpty) {
                              List<Data> profileList = snapshot.data!;
                              Data profileDetail = profileList[0];

                              if (profileDetail != null) {
                                return Text(
                                  profileDetail.name,
                                  style: const TextStyle(
                                    color: AppColor.blackColor,
                                    fontStyle: FontStyle.normal,
                                    decoration: TextDecoration.none,
                                    fontSize: 32,
                                    fontWeight: FontWeight.bold,
                                  ),
                                );
                              } else {
                                return const Center(
                                    child: Text("Data is incorrect"));
                              }
                            } else if (snapshot.hasError) {
                              return Center(
                                  child: Text(
                                      "The error in Profile : ${snapshot.error}"));
                            } else {
                              return const Center(child: Text("Please Wait"));
                            }
                          }),
                      const SizedBox(
                        height: 20,
                      ),
                      Center(
                        child: Image.asset(
                          ImageAssets.forkLifter,
                          height: 200,
                        ),
                      ),

                      const SizedBox(height: 20,),
                      Row(children: [
                        Expanded(
                          child: Container(

                            height: 10,
                            decoration: const BoxDecoration(
                              color: AppColor.redShadeColor,)
                          ),
                        ),
                        Expanded(
                          child: Container(

                              height: 10,
                              decoration: const BoxDecoration(
                                color: AppColor.containerColorTwo,)
                          ),
                        ),
                        Expanded(
                          child: Container(

                              height: 10,
                              decoration: const BoxDecoration(
                                color: AppColor.containerColorThree,)
                          ),
                        ),
                        Expanded(
                          child: Container(

                              height: 10,
                              decoration: const BoxDecoration(
                                color: AppColor.containerColorFour,)
                          ),
                        ),
                        Expanded(
                          child: Container(

                              height: 10,
                              decoration: const BoxDecoration(
                                color: AppColor.blackColor,)
                          ),
                        ),
                      ],),
                      Padding(
                        padding:
                            const EdgeInsets.only( top: 20),
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          // height: 280,
                          decoration: BoxDecoration(
                            color: AppColor.redShadeColor,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.shade300,
                                blurRadius: 3.0, // soften the shadow
                                spreadRadius: 3.0, //extend the shadow
                                offset: const Offset(
                                  1.0, // Move to right 5  horizontally
                                  1.0, // Move to bottom 5 Vertically
                                ),
                              )
                            ],
                          ),
                          height: 100,
                          child:  Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                               Text(
                                profileDetail.company!,
                                style: TextStyle(
                                  fontStyle: FontStyle.normal,
                                  fontWeight: FontWeight.w700,
                                  color: AppColor.whiteColor,
                                  fontSize: 26,
                                ),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Text(
                                profileDetail.warehouse,
                                style: const TextStyle(
                                  fontStyle: FontStyle.normal,
                                  fontWeight: FontWeight.w500,
                                  color: AppColor.whiteColor,
                                  fontSize: 24,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 20,),
                      Row(children: [
                        Expanded(
                          child: Container(

                              height: 10,
                              decoration: const BoxDecoration(
                                color: AppColor.blackColor,)
                          ),
                        ),
                        Expanded(
                          child: Container(

                              height: 10,
                              decoration: const BoxDecoration(
                                color: AppColor.containerColorFour,)
                          ),
                        ),
                        Expanded(
                          child: Container(

                              height: 10,
                              decoration: const BoxDecoration(
                                color: AppColor.containerColorThree,)
                          ),
                        ),
                        Expanded(
                          child: Container(

                              height: 10,
                              decoration: const BoxDecoration(
                                color: AppColor.containerColorTwo,)
                          ),
                        ),
                        Expanded(
                          child: Container(

                              height: 10,
                              decoration: const BoxDecoration(
                                color: AppColor.redShadeColor,)
                          ),
                        ),
                      ],),
                      Padding(padding: const EdgeInsets.only(left: 12, right: 12, top: 20),
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          // height: 280,
                          decoration: BoxDecoration(
                            color: AppColor.dashboardContainerColr,
                            borderRadius:
                                const BorderRadius.all(Radius.circular(20)),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.shade300,
                                blurRadius: 3.0, // soften the shadow
                                spreadRadius: 3.0, //extend the shadow
                                offset: const Offset(
                                  1.0, // Move to right 5  horizontally
                                  1.0, // Move to bottom 5 Vertically
                                ),
                              )
                            ],
                          ),

                          child: Padding(
                            padding: const EdgeInsets.all(20),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                RichText(
                                  text: TextSpan(
                                      text: 'brandText'.tr,
                                      style: const TextStyle(
                                        fontStyle: FontStyle.normal,
                                        fontWeight: FontWeight.w700,
                                        color: AppColor.whiteColor,
                                        fontSize: 22,
                                      ),
                                      children: <TextSpan>[
                                        TextSpan(
                                          text: ": ${profileDetail.make}",
                                          style: const TextStyle(
                                              fontStyle: FontStyle.normal,
                                              fontWeight: FontWeight.w400,
                                              color: AppColor.whiteColor,
                                              fontSize: 22),
                                        )
                                      ]),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                RichText(
                                  text: TextSpan(
                                      text: 'modelText'.tr,
                                      style: const TextStyle(
                                        fontStyle: FontStyle.normal,
                                        fontWeight: FontWeight.w700,
                                        color: AppColor.whiteColor,
                                        fontSize: 22,
                                      ),
                                      children: <TextSpan>[
                                        TextSpan(
                                          text: ": ${profileDetail.model}",
                                          style: const TextStyle(
                                              fontStyle: FontStyle.normal,
                                              fontWeight: FontWeight.w400,
                                              color: AppColor.whiteColor,
                                              fontSize: 22),
                                        )
                                      ]),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                RichText(
                                  text: TextSpan(
                                      text: 'seriesText'.tr,
                                      style: const TextStyle(
                                        fontStyle: FontStyle.normal,
                                        fontWeight: FontWeight.w700,
                                        color: AppColor.whiteColor,
                                        fontSize: 22,
                                      ),
                                      children: <TextSpan>[
                                        TextSpan(
                                          text: ": ${profileDetail.serie}",
                                          style: const TextStyle(
                                              fontStyle: FontStyle.normal,
                                              fontWeight: FontWeight.w400,
                                              color: AppColor.whiteColor,
                                              fontSize: 22),
                                        )
                                      ]),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                RichText(
                                  text: TextSpan(
                                      text: 'typeText'.tr,
                                      style: const TextStyle(
                                        fontStyle: FontStyle.normal,
                                        fontWeight: FontWeight.w700,
                                        color: AppColor.whiteColor,
                                        fontSize: 22,
                                      ),
                                      children: <TextSpan>[
                                        TextSpan(
                                          text:
                                              ": ${profileDetail.electric == 0 ? "nonElectricText".tr : "electricText".tr}",
                                          style: const TextStyle(
                                              fontStyle: FontStyle.normal,
                                              fontWeight: FontWeight.w400,
                                              color: AppColor.whiteColor,
                                              fontSize: 22),
                                        )
                                      ]),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                RichText(
                                  text: TextSpan(
                                      text: 'registrationNumberText'.tr,
                                      style: const TextStyle(
                                        fontStyle: FontStyle.normal,
                                        fontWeight: FontWeight.w700,
                                        color: AppColor.whiteColor,
                                        fontSize: 22,
                                      ),
                                      children: <TextSpan>[
                                        TextSpan(
                                          text: ": ${profileDetail.regNo}",
                                          style: const TextStyle(
                                              fontStyle: FontStyle.normal,
                                              fontWeight: FontWeight.w400,
                                              color: AppColor.whiteColor,
                                              fontSize: 22),
                                        )
                                      ]),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                RichText(
                                  text: TextSpan(
                                      text: 'registrationDateText'.tr,
                                      style: const TextStyle(
                                        fontStyle: FontStyle.normal,
                                        fontWeight: FontWeight.w700,
                                        color: AppColor.whiteColor,
                                        fontSize: 22,
                                      ),
                                      children: <TextSpan>[
                                        TextSpan(
                                          text: ": ${profileDetail.regDate}",
                                          style: const TextStyle(
                                              fontStyle: FontStyle.normal,
                                              fontWeight: FontWeight.w400,
                                              color: AppColor.whiteColor,
                                              fontSize: 22),
                                        )
                                      ]),
                                ),
                              ],
                            ),
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
