import 'package:flutter/material.dart';
import 'package:geoliftec/res/colors/colors.dart';
import 'package:geoliftec/utils/utils.dart';
import 'package:get/get.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import '../../model/dashboard/dashboard_model.dart';
import '../../res/assets/images/images.dart';
import '../../res/components/widgets/card/card_design_widget.dart';
import '../../res/components/widgets/buttons/round_button_widget.dart';
import '../../view_mode/controller/dashboard/dashboard_view_model.dart';
import '../../view_mode/controller/review/review_view_model.dart';

class ReviewView extends StatelessWidget {
  ReviewView({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormState>();

  final dashboardVM = Get.put(DashboardViewModel());
  final reviewVM = Get.put(ReviewViewModel());

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
                resizeToAvoidBottomInset: false,
                backgroundColor: AppColor.whiteColor,
                appBar: AppBar(
                  centerTitle: true,
                  automaticallyImplyLeading: false,
                  toolbarHeight: 110,
                  title: Column(
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
                            "AppBarInspectionText1".tr,
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 28,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ]),
                ),
                body: SafeArea(
                  child: SingleChildScrollView(
                    child: Form(
                      key: _formKey,
                      child: Column(
                        children: <Widget>[
                          profileDetail.electric == 0
                              ? CardDesign(

                                  title: 'radiatorLevelText'.tr,
                                  title1: 'radiator_level',
                                  icons: MdiIcons.radiator,
                                  controller: reviewVM.radiatorController.value,
                                  radioController:
                                      reviewVM.radiatorDropDownController.value,
                                )
                              : Container(),
                          profileDetail.electric == 0
                              ? CardDesign(

                                  title: 'engineOilText'.tr,
                                  title1: 'engine_oil',
                                  icons: MdiIcons.oil,
                                  controller: reviewVM.engineController.value,
                                  radioController:
                                      reviewVM.engineDropDownController.value,
                                )
                              : Container(),
                          CardDesign(

                            title: 'hydraulicOilText'.tr,
                            title1: 'hydraulic_Oil',
                            icons: MdiIcons.hydraulicOilLevel,
                            controller: reviewVM.hydraulicDriveController.value,
                            radioController:
                                reviewVM.hydraulicOilDropDownController.value,
                          ),
                          CardDesign(

                            title: 'brakeFluidText'.tr,
                            title1: 'brake_fluid',
                            icons: MdiIcons.carBrakeFluidLevel,
                            controller: reviewVM.brakeController.value,
                            radioController:
                                reviewVM.brakeDropDownController.value,
                          ),
                          CardDesign(

                            title: 'batteryElctroText'.tr,
                            title1: 'battery_electrolyte',
                            icons: MdiIcons.carBattery,
                            controller:
                                reviewVM.batteryElectrolyteController.value,
                            radioController: reviewVM
                                .batteryElectrolyteDropDownController.value,
                          ),
                          CardDesign(

                            title: 'fuelText'.tr,
                            title1: 'fuel',
                            icons: MdiIcons.fuel,
                            controller: reviewVM.fuelController.value,
                            radioController:
                                reviewVM.fuelDropDownController.value,
                          ),
                          CardDesign(

                            title: 'leaksText'.tr,
                            title1: 'Leaks',
                            icons: MdiIcons.pipeLeak,
                            controller: reviewVM.leaksController.value,
                            radioController:
                                reviewVM.leaksDropDownController.value,
                          ),
                          CardDesign(

                            title: 'mastChainText'.tr,
                            title1: 'mast_chains',
                            icons: MdiIcons.linkLock,
                            controller: reviewVM.mastChainController.value,
                            radioController:
                                reviewVM.mastChainDropDownController.value,
                          ),
                          CardDesign(
                            radioSize: reviewVM.radioSize.value,
                           // radioSize: 150,
                            title: 'hydraulicDriveText'.tr,
                            title1: 'hydraulic_drive',
                            icons: MdiIcons.hydroPower,
                            controller: reviewVM.hydraulicDriveController.value,
                            radioController:
                                reviewVM.hydraulicDriveDropDownController.value,
                          ),
                          CardDesign(
                            title: 'fuelText'.tr,
                            title1: 'fuel',
                            icons: MdiIcons.fuel,
                            controller: reviewVM.hydraulicHosesController.value,
                            radioController:
                                reviewVM.hydraulicHosesDropDownController.value,
                          ),
                          CardDesign(
                            title: 'mirrorsText'.tr,
                            title1: 'mirrors',
                            icons: MdiIcons.mirror,
                            controller: reviewVM.mirrorsController.value,
                            radioController:
                                reviewVM.mirrorsDropDownController.value,
                          ),
                          CardDesign(
                            title: 'pedalsText'.tr,
                            title1: 'pedals',
                            icons: MdiIcons.speedometerSlow,
                            controller: reviewVM.pedalsController.value,
                            radioController:
                                reviewVM.pedalsDropDownController.value,
                          ),
                          CardDesign(
                            title: 'tiresText'.tr,
                            title1: 'tires',
                            icons: MdiIcons.tire,
                            controller: reviewVM.tiresController.value,
                            radioController:
                                reviewVM.tiresDropDownController.value,
                          ),
                          CardDesign(

                            title: 'forksText'.tr,
                            title1: 'forks',
                            icons: MdiIcons.tools,
                            controller: reviewVM.forksController.value,
                            radioController:
                                reviewVM.forksDropDownController.value,
                          ),
                          CardDesign(

                            title: 'retroHornText'.tr,
                            title1: 'retro_horn',
                            icons: MdiIcons.airHorn,
                            controller: reviewVM.retroHornController.value,
                            radioController:
                                reviewVM.retroHornDropDownController.value,
                          ),
                          CardDesign(

                            title: 'flasherBeaconText'.tr,
                            title1: 'flasher_beacon',
                            icons: MdiIcons.alarmLight,
                            controller: reviewVM.flasherBeaconController.value,
                            radioController:
                                reviewVM.flasherBeaconDropDownController.value,
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          RoundButton(
                            buttonColor: AppColor.appBarColor,
                            width: Get.width,
                            height: Get.height * 0.07,
                            onPress: () async {
                              if (reviewVM.groupValue != null) {
                                int code = await reviewVM.inspection();

                                /// ----------------- Use to Clear Text Form Field ---------- ///
                                if (code == 200) {
                                  reviewVM.radiatorDropDownController.value
                                      .clear();
                                  reviewVM.radiatorController.value.clear();
                                  reviewVM.engineDropDownController.value
                                      .clear();
                                  reviewVM.engineController.value.clear();
                                  reviewVM.hydraulicOilDropDownController.value
                                      .clear();
                                  reviewVM.hydraulicOilController.value.clear();
                                  reviewVM.brakeDropDownController.value
                                      .clear();
                                  reviewVM.brakeController.value.clear();
                                  reviewVM.batteryElectrolyteDropDownController
                                      .value
                                      .clear();
                                  reviewVM.batteryElectrolyteController.value
                                      .clear();
                                  reviewVM.fuelDropDownController.value.clear();
                                  reviewVM.fuelController.value.clear();
                                  reviewVM.leaksDropDownController.value
                                      .clear();
                                  reviewVM.leaksController.value.clear();
                                  reviewVM.mastChainDropDownController.value
                                      .clear();
                                  reviewVM.mastChainController.value.clear();
                                  reviewVM
                                      .hydraulicDriveDropDownController.value
                                      .clear();
                                  reviewVM.hydraulicDriveController.value
                                      .clear();
                                  reviewVM
                                      .hydraulicHosesDropDownController.value
                                      .clear();
                                  reviewVM.hydraulicHosesController.value
                                      .clear();
                                  reviewVM.mirrorsDropDownController.value
                                      .clear();
                                  reviewVM.mirrorsController.value.clear();
                                  reviewVM.pedalsDropDownController.value
                                      .clear();
                                  reviewVM.pedalsController.value.clear();
                                  reviewVM.tiresDropDownController.value
                                      .clear();
                                  reviewVM.tiresController.value.clear();
                                  reviewVM.forksDropDownController.value
                                      .clear();
                                  reviewVM.forksController.value.clear();
                                  reviewVM.retroHornDropDownController.value
                                      .clear();
                                  reviewVM.retroHornController.value.clear();
                                  reviewVM.flasherBeaconDropDownController.value
                                      .clear();
                                  reviewVM.flasherBeaconController.value
                                      .clear();
                                }

                                /// ---------------The End -------------------- ///
                              }
                              else{

                                Utils.snackBar("dataUploadUnSuccess".tr, "tryAgainText".tr);
                                await Future.delayed(const Duration(
                                    milliseconds: 500)); // add a delay before showing the dialog

                              }

                            },
                            title: "reviewButtonText".tr,
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                        ],
                      ),
                    ),
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
