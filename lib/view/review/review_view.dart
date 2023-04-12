import 'package:flutter/material.dart';
import 'package:geoliftec/res/colors/colors.dart';
import 'package:get/get.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import '../../res/components/widgets/card/card_design_widget.dart';
import '../../res/components/widgets/buttons/round_button_widget.dart';
import '../../view_mode/controller/review/review_view_model.dart';

class ReviewView extends StatefulWidget {
  const ReviewView({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _ReviewViewState createState() => _ReviewViewState();
}

class _ReviewViewState extends State<ReviewView> {
  final _formKey = GlobalKey<FormState>();
  final reviewVM = Get.put(ReviewViewModel());
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
          "Inspection Report",
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.w800, fontSize: 32),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                CardDesign(
                  hintFontSize: 15,
                  title: 'Radiator Level',
                  title1: 'radiator_level',
                  icons: MdiIcons.radiator,
                  controller: reviewVM.radiatorController.value,
                  dropDownController: reviewVM.radiatorDropDownController.value,
                ),
                CardDesign(
                  hintFontSize: 20,
                  dropDownSize: 232.7,
                  title: 'Engine Oil',
                  title1: 'engine_oil',
                  icons: MdiIcons.oil,
                  controller: reviewVM.engineController.value,
                  dropDownController: reviewVM.engineDropDownController.value,
                ),
                CardDesign(
                  hintFontSize: 17,
                  dropDownSize: 200,
                  title: 'Hydraulic Oil',
                  title1: 'hydraulic_Oil',
                  icons: MdiIcons.hydraulicOilLevel,
                  controller: reviewVM.hydraulicDriveController.value,
                  dropDownController:
                      reviewVM.hydraulicOilDropDownController.value,
                ),
                CardDesign(
                  hintFontSize: 19,
                  dropDownSize: 217,
                  title: 'Brake Fluid',
                  title1: 'brake_fluid',
                  icons: MdiIcons.carBrakeFluidLevel,
                  controller: reviewVM.brakeController.value,
                  dropDownController: reviewVM.brakeDropDownController.value,
                ),
                CardDesign(
                  hintFontSize: 8.8,
                  dropDownSize: 125,
                  title: 'Battery Electrolyte',
                  title1: 'battery_electrolyte',
                  icons: MdiIcons.carBattery,
                  controller: reviewVM.batteryElectrolyteController.value,
                  dropDownController:
                      reviewVM.batteryElectrolyteDropDownController.value,
                ),
                CardDesign(
                  hintFontSize: 22,
                  dropDownSize: 307,
                  title: 'Fuel',
                  title1: 'fuel',
                  icons: MdiIcons.fuel,
                  controller: reviewVM.fuelController.value,
                  dropDownController: reviewVM.fuelDropDownController.value,
                ),
                CardDesign(
                  hintFontSize: 22,
                  dropDownSize: 284,
                  title: 'Leaks',
                  title1: 'Leaks',
                  icons: MdiIcons.pipeLeak,
                  controller: reviewVM.leaksController.value,
                  dropDownController: reviewVM.leaksDropDownController.value,
                ),
                CardDesign(
                  hintFontSize: 18,
                  dropDownSize: 201,
                  title: 'Mast Chains',
                  title1: 'mast_chains',
                  icons: MdiIcons.linkLock,
                  controller: reviewVM.mastChainController.value,
                  dropDownController:
                      reviewVM.mastChainDropDownController.value,
                ),
                CardDesign(
                  hintFontSize: 13,
                  dropDownSize: 165,
                  title: 'Hydraulic Drive',
                  title1: 'hydraulic_drive',
                  icons: MdiIcons.hydroPower,
                  controller: reviewVM.hydraulicDriveController.value,
                  dropDownController:
                      reviewVM.hydraulicDriveDropDownController.value,
                ),
                CardDesign(
                  hintFontSize: 12,
                  dropDownSize: 153,
                  title: 'Hydraulic Hoses',
                  title1: 'hydraulic_hoses',
                  icons: MdiIcons.pipe,
                  controller: reviewVM.hydraulicHosesController.value,
                  dropDownController:
                      reviewVM.hydraulicHosesDropDownController.value,
                ),
                CardDesign(
                  hintFontSize: 22,
                  dropDownSize: 265,
                  title: 'Mirrors',
                  title1: 'mirrors',
                  icons: MdiIcons.mirror,
                  controller: reviewVM.mirrorsController.value,
                  dropDownController: reviewVM.mirrorsDropDownController.value,
                ),
                CardDesign(
                  hintFontSize: 22,
                  dropDownSize: 271,
                  title: 'Pedals',
                  title1: 'pedals',
                  icons: MdiIcons.speedometerSlow,
                  controller: reviewVM.pedalsController.value,
                  dropDownController: reviewVM.pedalsDropDownController.value,
                ),
                CardDesign(
                  hintFontSize: 22,
                  dropDownSize: 292,
                  title: 'Tires',
                  title1: 'tires',
                  icons: MdiIcons.tire,
                  controller: reviewVM.tiresController.value,
                  dropDownController: reviewVM.tiresDropDownController.value,
                ),
                CardDesign(
                  hintFontSize: 22,
                  dropDownSize: 287,
                  title: 'Forks',
                  title1: 'forks',
                  icons: MdiIcons.tools,
                  controller: reviewVM.forksController.value,
                  dropDownController: reviewVM.forksDropDownController.value,
                ),
                CardDesign(
                  hintFontSize: 20,
                  dropDownSize: 225,
                  title: 'Retro horn',
                  title1: 'retro_horn',
                  icons: MdiIcons.airHorn,
                  controller: reviewVM.retroHornController.value,
                  dropDownController:
                      reviewVM.retroHornDropDownController.value,
                ),
                CardDesign(
                  hintFontSize: 13,
                  dropDownSize: 163,
                  title: 'Flasher Beacon',
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
                  onPress: () {
                    if (_formKey.currentState!.validate()) {
                      reviewVM.inspection();

                      /// ----------------- Use to Clear Text Form Field ---------- ///
                      reviewVM.radiatorDropDownController.value.clear();
                      reviewVM.radiatorController.value.clear();
                      reviewVM.engineDropDownController.value.clear();
                      reviewVM.engineController.value.clear();
                      reviewVM.hydraulicOilDropDownController.value.clear();
                      reviewVM.hydraulicOilController.value.clear();
                      reviewVM.brakeDropDownController.value.clear();
                      reviewVM.brakeController.value.clear();
                      reviewVM.batteryElectrolyteDropDownController.value.clear();
                      reviewVM.batteryElectrolyteController.value.clear();
                      reviewVM.fuelDropDownController.value.clear();
                      reviewVM.fuelController.value.clear();
                      reviewVM.leaksDropDownController.value.clear();
                      reviewVM.leaksController.value.clear();
                      reviewVM.mastChainDropDownController.value.clear();
                      reviewVM.mastChainController.value.clear();
                      reviewVM.hydraulicDriveDropDownController.value.clear();
                      reviewVM.hydraulicDriveController.value.clear();
                      reviewVM.hydraulicHosesDropDownController.value.clear();
                      reviewVM.hydraulicHosesController.value.clear();
                      reviewVM.mirrorsDropDownController.value.clear();
                      reviewVM.mirrorsController.value.clear();
                      reviewVM.pedalsDropDownController.value.clear();
                      reviewVM.pedalsController.value.clear();
                      reviewVM.tiresDropDownController.value.clear();
                      reviewVM.tiresController.value.clear();
                      reviewVM.forksDropDownController.value.clear();
                      reviewVM.forksController.value.clear();
                      reviewVM.retroHornDropDownController.value.clear();
                      reviewVM.retroHornController.value.clear();
                      reviewVM.flasherBeaconDropDownController.value.clear();
                      reviewVM.flasherBeaconController.value.clear();

                      /// ---------------The End -------------------- ///
                    }
                  },
                  title: "All Checked",
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
  }
}
