import 'package:flutter/material.dart';
import 'package:geoliftec/res/colors/colors.dart';

class DashBoardContainerWidget extends StatelessWidget {
  // final IconData iconDiplay;
  final String title;
  final String subtitle;
  final AssetImage imageDisplay;
  final double textPading;
  const DashBoardContainerWidget(
      {Key? key,
      //   required this.iconDiplay,
      required this.title,
        this.textPading = 0,
      required this.subtitle,
      required this.imageDisplay})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Container(
        width: 220,
        height: 190,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade300,
              blurRadius: 1.0, // soften the shadow
              spreadRadius: 1.0, //extend the shadow
              offset: Offset(
                1.0, // Move to right 5  horizontally
                1.0, // Move to bottom 5 Vertically
              ),
            )
          ],
          // border: Border.all(width: 3),
          borderRadius: BorderRadius.all(Radius.circular(15)),
          color: AppColor.dashboardContainerColor,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image(image: imageDisplay,height: 100),
            // Text(
            //   title,
            //   style: const TextStyle(
            //     fontStyle: FontStyle.normal,
            //     fontWeight: FontWeight.w700,
            //     color: AppColor.dashboardContainerTextColor,
            //     fontSize: 28,
            //   ),
            // ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: EdgeInsets.only(left: textPading),
              child: Text(
                subtitle,
                style: const TextStyle(
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.w700,
                  color: AppColor.blackColor,
                  fontSize: 25,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
