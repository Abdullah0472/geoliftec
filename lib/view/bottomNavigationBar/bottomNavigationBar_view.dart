// ignore: file_names
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geoliftec/res/colors/colors.dart';
import 'package:geoliftec/view/custom_inspection/custom_inspection_view.dart';
import 'package:geoliftec/view/dashboard/dashboard_view.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import '../../res/components/widgets/navigationBar/navigationBar.dart';
import '../profile/profile_view.dart';
import '../review/review_view.dart';

class BottomNavigationBarView extends StatefulWidget {
  const BottomNavigationBarView({Key? key}) : super(key: key);

  @override
  State<BottomNavigationBarView> createState() =>
      _BottomNavigationBarViewState();
}

class _BottomNavigationBarViewState extends State<BottomNavigationBarView> {
  int _selectedIndex = 0;

  final List _widgetOptions = [
    ///------------ Name of The Screens/View ------------------- ///

    /// Will Be Moving To Dashboard Screen

    DashboardView(),

    /// Will Be Moving To Profile Screen

    //  ProfileViewTesting(),
    ///Will Be Moving To HomeView/Inspection Screen

    ReviewView(),

    ///Will Be Moving To Custom Inspection View Screen

    CustomInspectionView(),
    ProfileView(),
  ];

  _onItemTapped(var index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      // Close the app when the back button is pressed
      onWillPop: () async {
        // Close the app when the back button is pressed
        SystemNavigator.pop();
        return Future.value(false); // Return false to allow the app to close
      },
      child: Scaffold(
          body: _widgetOptions.elementAt(_selectedIndex),
          bottomNavigationBar: CustomAnimatedBottomBar(
            containerHeight: 75,
            backgroundColor: AppColor.offWhite,
            selectedIndex: _selectedIndex,
            showElevation: true,
            itemCornerRadius: 10,
            curve: Curves.easeIn,
            onItemSelected: _onItemTapped,
            type: BottomNavigationBarType.fixed,
            onTap: () {
              _onItemTapped(_selectedIndex);
            },
            items: <BottomNavyBarItem>[
              BottomNavyBarItem(
                icon: const Icon(
                  MdiIcons.viewDashboard,
                  size: 30,
                ),
                title: const Text(
                  'Dashboard',
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 15),
                ),
                activeColor: AppColor.appBarColor,
                inactiveColor: AppColor.iconBottomNavBarColor,
                textAlign: TextAlign.center,
              ),
              BottomNavyBarItem(
                icon: const Icon(
                  MdiIcons.forklift,
                  size: 34,
                ),
                title: const Text(
                  'Inspection',
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
                ),
                activeColor: AppColor.appBarColor,
                inactiveColor: AppColor.iconBottomNavBarColor,
                textAlign: TextAlign.center,
              ),
              BottomNavyBarItem(
                icon: const Icon(
                  MdiIcons.faceAgent,
                  size: 34,
                ),
                title: const Text(
                  'Custom Inspection',
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
                ),
                activeColor: AppColor.appBarColor,
                inactiveColor: AppColor.iconBottomNavBarColor,
                textAlign: TextAlign.center,
              ),
              BottomNavyBarItem(
                icon: const Icon(
                  MdiIcons.accountCircle,
                  size: 34,
                ),
                title: const Text(
                  'Profile',
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 15),
                ),
                activeColor: AppColor.appBarColor,
                inactiveColor: AppColor.iconBottomNavBarColor,
                textAlign: TextAlign.center,
              ),
            ],
          )),
    );
  }
}
