import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../res/colors/colors.dart';

class Utils {
  static void fieldFocusChange(
      BuildContext context, FocusNode current, FocusNode nextFocus) {
    current.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }

  static void fieldFocusReviewChange(
      BuildContext context,
      FocusNode current,
      FocusNode nextFocus,
      String arg1,
      String arg2,
      String arg3,
      String arg4,
      String arg5,
      String arg6,
      String arg7,
      String arg8,
      String arg9,
      String arg10,
      String arg11,
      String arg12,
      String arg13,
      String arg14,
      ) {
    current.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }

  static toastMessage(String message) {
    Fluttertoast.showToast(
      msg: message,
      backgroundColor: AppColor.redColor,
      textColor: AppColor.whiteColor,
      gravity: ToastGravity.BOTTOM,
      toastLength: Toast.LENGTH_LONG,
    );
  }

  static toastMessageCenter(String message) {
    Fluttertoast.showToast(
      msg: message,
      backgroundColor: AppColor.redColor,
      gravity: ToastGravity.CENTER,
      toastLength: Toast.LENGTH_LONG,
      textColor: AppColor.whiteColor,
    );
  }

  static snackBar(String title, String message) {
    Get.snackbar(
      backgroundColor: AppColor.drakerColor,
      icon: const Icon(MdiIcons.bellRing,size: 35,color: AppColor.whiteColor,),
      colorText: AppColor.whiteColor,
      title,
      message,
    );
  }
}
