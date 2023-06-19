import 'package:flutter/material.dart';
import 'package:geoliftec/res/components/widgets/buttons/radio_button/radio_button.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import '../formfield/input_review_widget.dart';

class CardDesign extends StatelessWidget {
  final String title;
  String title1;
  final IconData icons;
  final double radioSize;
  TextEditingController controller;
  TextEditingController radioController;

  CardDesign({
    Key? key,
    required this.title,
    required this.title1,
    required this.icons,
    this.radioSize = 180,
    required this.controller,

    required this.radioController,
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
      margin: const EdgeInsets.only(top: 20, left: 12, right: 12),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10, top: 12, bottom: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 2,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          icons,
                          size: 35,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10, left: 6),
                          child: Text(
                            title,
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width:  radioSize,
                    child: MyRadioButtons(
                      onSelected: (String? selectedValue) {
                        title1 = selectedValue!;
                        radioController.text = selectedValue;
                      },
                      radioController: radioController,
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