import 'package:flutter/material.dart';
import 'package:geoliftec/res/colors/colors.dart';
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
                                  hintFontSize: 12,
                                  title: 'radiatorLevelText'.tr,
                                  title1: 'radiator_level',
                                  icons: MdiIcons.radiator,
                                  controller: reviewVM.radiatorController.value,
                                  dropDownController:
                                      reviewVM.radiatorDropDownController.value,
                                )
                              : Container(),
                          profileDetail.electric == 0
                              ? CardDesign(
                                  hintFontSize: 17,
                                  dropDownSize: 232.7,
                                  title: 'engineOilText'.tr,
                                  title1: 'engine_oil',
                                  icons: MdiIcons.oil,
                                  controller: reviewVM.engineController.value,
                                  dropDownController:
                                      reviewVM.engineDropDownController.value,
                                )
                              : Container(),
                          CardDesign(
                            hintFontSize: 14,
                            dropDownSize: 200,
                            title: 'hydraulicOilText'.tr,
                            title1: 'hydraulic_Oil',
                            icons: MdiIcons.hydraulicOilLevel,
                            controller: reviewVM.hydraulicDriveController.value,
                            dropDownController:
                                reviewVM.hydraulicOilDropDownController.value,
                          ),
                          CardDesign(
                            hintFontSize: 12,
                            dropDownSize: 180,
                            title: 'brakeFluidText'.tr,
                            title1: 'brake_fluid',
                            icons: MdiIcons.carBrakeFluidLevel,
                            controller: reviewVM.brakeController.value,
                            dropDownController:
                                reviewVM.brakeDropDownController.value,
                          ),
                          CardDesign(
                            hintFontSize: 12,
                            dropDownSize: 180,
                            title: 'batteryElctroText'.tr,
                            title1: 'battery_electrolyte',
                            icons: MdiIcons.carBattery,
                            controller:
                                reviewVM.batteryElectrolyteController.value,
                            dropDownController: reviewVM
                                .batteryElectrolyteDropDownController.value,
                          ),
                          CardDesign(
                            hintFontSize: 18,
                            dropDownSize: 250,
                            title: 'fuelText'.tr,
                            title1: 'fuel',
                            icons: MdiIcons.fuel,
                            controller: reviewVM.fuelController.value,
                            dropDownController:
                                reviewVM.fuelDropDownController.value,
                          ),
                          CardDesign(
                            hintFontSize: 22,
                            dropDownSize: 284,
                            title: 'leaksText'.tr,
                            title1: 'Leaks',
                            icons: MdiIcons.pipeLeak,
                            controller: reviewVM.leaksController.value,
                            dropDownController:
                                reviewVM.leaksDropDownController.value,
                          ),
                          CardDesign(
                            hintFontSize: 14,
                            dropDownSize: 201,
                            title: 'mastChainText'.tr,
                            title1: 'mast_chains',
                            icons: MdiIcons.linkLock,
                            controller: reviewVM.mastChainController.value,
                            dropDownController:
                                reviewVM.mastChainDropDownController.value,
                          ),
                          CardDesign(
                            hintFontSize: 8,
                            dropDownSize: 135,
                            title: 'hydraulicDriveText'.tr,
                            title1: 'hydraulic_drive',
                            icons: MdiIcons.hydroPower,
                            controller: reviewVM.hydraulicDriveController.value,
                            dropDownController:
                                reviewVM.hydraulicDriveDropDownController.value,
                          ),
                          CardDesign(
                            hintFontSize: 9,
                            dropDownSize: 153,
                            title: 'hydraulicHosesText'.tr,
                            title1: 'hydraulic_hoses',
                            icons: MdiIcons.pipe,
                            controller: reviewVM.hydraulicHosesController.value,
                            dropDownController:
                                reviewVM.hydraulicHosesDropDownController.value,
                          ),
                          CardDesign(
                            hintFontSize: 20,
                            dropDownSize: 265,
                            title: 'mirrorsText'.tr,
                            title1: 'mirrors',
                            icons: MdiIcons.mirror,
                            controller: reviewVM.mirrorsController.value,
                            dropDownController:
                                reviewVM.mirrorsDropDownController.value,
                          ),
                          CardDesign(
                            hintFontSize: 20,
                            dropDownSize: 271,
                            title: 'pedalsText'.tr,
                            title1: 'pedals',
                            icons: MdiIcons.speedometerSlow,
                            controller: reviewVM.pedalsController.value,
                            dropDownController:
                                reviewVM.pedalsDropDownController.value,
                          ),
                          CardDesign(
                            hintFontSize: 22,
                            dropDownSize: 292,
                            title: 'tiresText'.tr,
                            title1: 'tires',
                            icons: MdiIcons.tire,
                            controller: reviewVM.tiresController.value,
                            dropDownController:
                                reviewVM.tiresDropDownController.value,
                          ),
                          CardDesign(
                            hintFontSize: 19,
                            dropDownSize: 250,
                            title: 'forksText'.tr,
                            title1: 'forks',
                            icons: MdiIcons.tools,
                            controller: reviewVM.forksController.value,
                            dropDownController:
                                reviewVM.forksDropDownController.value,
                          ),
                          CardDesign(
                            hintFontSize: 17,
                            dropDownSize: 225,
                            title: 'retroHornText'.tr,
                            title1: 'retro_horn',
                            icons: MdiIcons.airHorn,
                            controller: reviewVM.retroHornController.value,
                            dropDownController:
                                reviewVM.retroHornDropDownController.value,
                          ),
                          CardDesign(
                            hintFontSize: 10,
                            dropDownSize: 163,
                            title: 'flasherBeaconText'.tr,
                            title1: 'flasher_beacon',
                            icons: MdiIcons.alarmLight,
                            controller: reviewVM.flasherBeaconController.value,
                            dropDownController:
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
                              if (_formKey.currentState!.validate()) {
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
