import 'package:flutter/material.dart';
import '../../../colors/colors.dart';

// ignore: must_be_immutable
class CardProfileDesign extends StatelessWidget {
  //final String title;
  final String info;
  final IconData icons;

  const CardProfileDesign({
    Key? key,
    //required this.title,
    required this.info,
    required this.icons,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      semanticContainer: true,
      clipBehavior: Clip.antiAlias,
      elevation: 5,
      margin: const EdgeInsets.only(top: 20, left: 12, right: 12),
      color: AppColor.appBarColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
        side: const BorderSide(
          width: 3,
          color: AppColor.blackColor
        ),
      ),
      child: Padding(
        padding:
            const EdgeInsets.only(left: 18, top: 25, bottom: 20, right: 18),
        child: IntrinsicHeight(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                icons,
                size: 40,
                color: AppColor.whiteColor,
              ),
              const SizedBox(width: 10),
              const VerticalDivider(thickness: 1.2,color: AppColor.whiteColor),
              const SizedBox(width: 5),
              Flexible(
                child: Text(
                  info,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  textDirection: TextDirection.ltr,
                  textAlign: TextAlign.start,
                  style: const TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.w500,
                      color: AppColor.whiteColor),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
