import 'package:flutter/material.dart';
import '../../../colors/colors.dart';


// ignore: must_be_immutable
class CardProfileDesign extends StatelessWidget {
  //final String title;
  final String info;
  final IconData icons;


  const CardProfileDesign(
      {Key? key,
        //required this.title,
        required this.info,
        required this.icons,


      })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      semanticContainer: true,
      clipBehavior: Clip.antiAlias,
      elevation: 12,
      margin: const EdgeInsets.only(top: 20, left: 12, right: 12),
      color: AppColor.cardColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
        side: const BorderSide(
          width: 3,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 18, top: 25, bottom: 20,right: 18),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
              Icon(icons,size: 40,color: AppColor.whiteColor,),
            // Text(
            //   title,
            //   style: const TextStyle(
            //       fontSize: 30,
            //       fontWeight: FontWeight.bold,
            //       color: AppColor.whiteColor),
            //
            // ),
       Flexible(
          child: Text(
            info,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            textDirection: TextDirection.ltr,
            textAlign: TextAlign.center,
            style: const TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.w400,
                color: AppColor.whiteColor),),
        ),
          ],
        ),
      ),
    );
  }
}
