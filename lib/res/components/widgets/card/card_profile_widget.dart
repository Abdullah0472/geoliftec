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
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.0),
          boxShadow: [
            BoxShadow(
              offset: const Offset(1, 1),
              color: Colors.grey.shade300,
              blurRadius: 3,
              spreadRadius: 3,
            )
          ]),
      clipBehavior: Clip.antiAlias,
      margin: const EdgeInsets.only(top: 20, left: 20, right: 20),
      child: Padding(
        padding:
            const EdgeInsets.only(left: 18, top: 10, bottom: 10, right: 18),
        child: IntrinsicHeight(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                icons,
                size: 25,
              ),
              const SizedBox(width: 10),
              const VerticalDivider(thickness: 1.2, color: AppColor.whiteColor),
              const SizedBox(width: 5),
              Flexible(
                child: Text(
                  info,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  textDirection: TextDirection.ltr,
                  textAlign: TextAlign.start,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
