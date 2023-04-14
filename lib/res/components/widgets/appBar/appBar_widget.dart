
import 'package:flutter/material.dart';
import '../../../colors/colors.dart';
class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final double appBarHeight = 200;
  final String title;
  final NetworkImage imageUrl;

  const CustomAppBar({
    Key? key,
    required this.title,
    required this.imageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: Size.fromHeight(appBarHeight),
      child: AppBar(
        automaticallyImplyLeading: false,
        iconTheme: const IconThemeData(color: AppColor.whiteColor),
        elevation: 0,
        backgroundColor: AppColor.appBarColor,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(160),
            bottomRight: Radius.circular(160),
          ),
        ),
        flexibleSpace: Stack(
          clipBehavior: Clip.none,
          alignment: Alignment.bottomCenter,
          children: [
            Positioned(
              top: 90,
              child:
              // CustomPaint(
              //   painter: AppBarPainter(
              //     title,
              //     textStyle: TextStyle(
              //       fontSize: 30,
              //       fontWeight: FontWeight.bold,
              //       color: Colors.white,
              //     ),
              //   ),
              //   child: SizedBox(
              //     width: 300,
              //     height: 80,
              //   ),
              // ),

              Text(
                title,
                style: const TextStyle(
                  color: AppColor.whiteColor,
                  fontStyle: FontStyle.italic,
                  decoration: TextDecoration.underline,
                  fontSize: 35,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            Positioned(
              bottom: -60,
              child: CircleAvatar(
                radius: 75,
                backgroundImage: imageUrl,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(appBarHeight);
}
