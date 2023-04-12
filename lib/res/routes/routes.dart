import 'package:geoliftec/view/bottomNavigationBar/bottomNavigationBar_view.dart';
import 'package:geoliftec/view/custom_inspection/custom_inspection_view.dart';
import 'package:geoliftec/view/dashboard/dashboard_view.dart';


import 'package:geoliftec/view/profile/profile_view.dart';
import 'package:geoliftec/view/review/review_view.dart';

import 'package:get/get.dart';
import '../../view/signin/signin_view.dart';
import '../../view/splash/splash_view.dart';
import 'routes_name.dart';

class AppRoutes {
  static appRoutes() => [
        GetPage(
          name: RouteName.splashView,
          page: () => const SplashView(),
          transitionDuration: const Duration(milliseconds: 250),
          transition: Transition.rightToLeftWithFade,
        ),
        GetPage(
          name: RouteName.signInView,
          page: () => const SignInView(),
          transitionDuration: const Duration(milliseconds: 250),
          transition: Transition.leftToRightWithFade,
        ),
        GetPage(
          name: RouteName.reviewView,
          page: () => const ReviewView(),
          transitionDuration: const Duration(milliseconds: 250),
          transition: Transition.rightToLeftWithFade,
        ),
        GetPage(
          name: RouteName.bottomNavBarView,
          page: () => const BottomNavigationBarView(),
          transitionDuration: const Duration(milliseconds: 250),
          transition: Transition.rightToLeftWithFade,
        ),
        GetPage(
          name: RouteName.profileView,
          page: () => ProfileView(),
          transitionDuration: const Duration(milliseconds: 250),
          transition: Transition.leftToRightWithFade,
        ),
        GetPage(
          name: RouteName.dashboardView,
          page: () =>  DashboardView(),
          transitionDuration: const Duration(milliseconds: 250),
          transition: Transition.rightToLeftWithFade,
        ),
    GetPage(
      name: RouteName.customInspectionView,
      page: () =>  CustomInspectionView(),
      transitionDuration: const Duration(milliseconds: 250),
      transition: Transition.leftToRightWithFade,
    ),
      ];
}
