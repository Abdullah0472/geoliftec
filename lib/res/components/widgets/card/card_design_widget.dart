import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import '../../../colors/colors.dart';
import '../dropdown/dropDown.dart';
import '../formfield/input_review_widget.dart';

// ignore: must_be_immutable
class CardDesign extends StatelessWidget {
  final String title;
  String title1;
  final IconData icons;
  final double dropDownSize;
  final double hintFontSize;
  TextEditingController controller;
  TextEditingController dropDownController;


  CardDesign(
      {Key? key,
      required this.title,
      required this.title1,
      required this.icons,
        this.dropDownSize = 180,
      required this.controller,
        this.hintFontSize = 18,
      required this.dropDownController,
      })
      : super(key: key);

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
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10, top: 12, bottom: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        icons,
                        color: AppColor.whiteColor,
                        size: 35,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10, left: 6),
                        child: Text(
                          title,
                          style: const TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.w600,
                              color: AppColor.whiteColor),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(width: 20,),
                  SizedBox(
                    width: dropDownSize,
                    child: DropDown(
                      hintSize: hintFontSize,
                      onSelected: (String? selectedValue) {
                        title1 = selectedValue!;
                      }, dropDownController: dropDownController,
                    ),
                  ),
                ],
              ),
            ),
            InputReviewTextField(
              controller: controller,
              icons: MdiIcons.noteOutline,
            )
          ],
        ),
      ),
    );
  }
}
