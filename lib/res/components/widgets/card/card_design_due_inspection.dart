import 'package:flutter/material.dart';
import 'package:geoliftec/res/components/widgets/buttons/radio_button/radio_button.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import '../../../colors/colors.dart';
import '../dropdown/dropDown.dart';
import '../formfield/input_review_widget.dart';

// ignore: must_be_immutable
class CardDesignDueInspection extends StatelessWidget {
  final String title;
  String title1;
  final IconData icons;
  TextEditingController controller;
  TextEditingController radioController;

  CardDesignDueInspection({
    Key? key,
    required this.title,
    required this.title1,
    required this.icons,

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
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    // Use Flexible or Expanded to allow title to cover multiple lines
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          icons,
                          size: 35,
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Text(
                            title,
                            overflow: TextOverflow.clip,
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  MyRadioButtons(
                    onSelected: (String? selectedValue) {
                      title1 = selectedValue!;
                      radioController.text = selectedValue;
                    },
                    radioController: radioController,
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
