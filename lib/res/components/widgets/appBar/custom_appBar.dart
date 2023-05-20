import 'package:flutter/material.dart';
import 'package:geoliftec/res/components/widgets/appBar/custom_shape.dart';
import '../../../colors/colors.dart';

class CustomAppBarProfile extends StatelessWidget
    implements PreferredSizeWidget {
  final double appBarHeight = 200;
  final String title;
  final NetworkImage imageUrl;

  const CustomAppBarProfile({
    Key? key,
    required this.title,
    required this.imageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      iconTheme: const IconThemeData(color: AppColor.whiteColor),
      toolbarHeight: 200,
      backgroundColor: Colors.transparent,
      elevation: 0.0,
      flexibleSpace: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            height: 280,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: AppColor.primaryColor,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
            ),
            child: Center(
              child: Text(
                title,
                style: const TextStyle(
                  color: AppColor.whiteColor,
                  fontStyle: FontStyle.normal,
                  decoration: TextDecoration.none,
                  fontSize: 25,
                  fontWeight: FontWeight.w500,
                ),
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
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(appBarHeight);
}
