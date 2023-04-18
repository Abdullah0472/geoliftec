// ignore_for_file: unnecessary_null_comparison

import 'package:flutter/material.dart';
import 'package:geoliftec/model/profile/profile_model.dart';
import 'package:geoliftec/view_mode/controller/profile/profile_view_model.dart';
import 'package:get/get.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import '../../res/colors/colors.dart';
import '../../res/components/widgets/appBar/custom_appBar.dart';
import '../../res/components/widgets/card/card_profile_widget.dart';

class ProfileView extends StatelessWidget {
  ProfileView({Key? key}) : super(key: key);
  final profileVM = Get.put(ProfileViewModel());
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Data>>(
        future: profileVM.fetchProfileData(),
        builder: (BuildContext context, AsyncSnapshot<List<Data>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasData && snapshot.data!.isNotEmpty) {
            List<Data> profileList = snapshot.data!;
            Data profileDetail = profileList[0];

            if (profileDetail != null) {
              return Scaffold(
                  resizeToAvoidBottomInset: false,
                  backgroundColor: AppColor.whiteColor,
                  appBar: CustomAppBarProfile(
                    title: profileDetail.name,
                    imageUrl: profileDetail.image.startsWith('http')
                        ? NetworkImage(profileDetail.image)
                        : profileDetail.image.startsWith('https://')
                            ? NetworkImage(profileDetail.image)
                            : const NetworkImage(
                                'https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2'),
                  ),
                  body: SafeArea(
                      child: Padding(
                    padding: const EdgeInsets.only(top: 45),
                    child: SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      child: Column(
                        children: [
                          CardProfileDesign(
                            info: profileDetail.name,
                            icons: (MdiIcons.accountCircle),
                          ),
                          CardProfileDesign(
                              info: profileDetail.address,
                              icons: MdiIcons.mapMarker),
                          CardProfileDesign(
                              info: profileDetail.email, icons: MdiIcons.email),
                          CardProfileDesign(
                              info: profileDetail.phone,
                              icons: MdiIcons.contacts),
                          CardProfileDesign(
                              info: profileDetail.trainingCertificate,
                              icons: MdiIcons.certificate),
                          CardProfileDesign(
                              info: profileDetail.license,
                              icons: MdiIcons.license),
                        ],
                      ),
                    ),
                  )));
            } else {
              return const Center(child: Text("Data is incorrect"));
            }
          } else if (snapshot.hasError) {
            return Center(child: Text("The error in Profile : ${snapshot.error}"));
          } else {
            return const Center(child: Text("Please Wait"));
          }
        });
  }
}
