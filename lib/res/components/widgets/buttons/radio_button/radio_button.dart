import 'package:flutter/material.dart';
import 'package:geoliftec/res/assets/images/images.dart';
import 'package:geoliftec/view_mode/controller/review/review_view_model.dart';
import 'package:get/get.dart';

class MyRadioButtons extends StatefulWidget {
  final Function(String?) onSelected;
  final TextEditingController radioController;

  const MyRadioButtons(
      {Key? key, required this.onSelected, required this.radioController})
      : super(key: key);

  @override
  State<MyRadioButtons> createState() => _MyRadioButtonsState();
}

class _MyRadioButtonsState extends State<MyRadioButtons> {
  final reviewVM = Get.put(ReviewViewModel());


  final items = ['Good', 'Bad'];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Row(
        children: items.map((item) {
          Image icon;
          if (item == 'Good') {
            icon = Image.asset(ImageAssets.tick,width: 25,height: 25,);
          } else if (item == 'Bad') {
            icon = Image.asset(ImageAssets.cross,width: 25,height: 25,);
          } else {
            icon = Image.asset('');
          }

          return
          Row(children: [
            Radio<String>(
              value: item,
              groupValue: reviewVM.groupValue,
              onChanged: (value) {
                setState(() {
                  reviewVM.groupValue = value!;
                  widget.radioController.text = reviewVM.groupValue!;
                });
                widget.onSelected(reviewVM.groupValue);
              },
            ),
            icon,
          ],);
        }).toList(),
      ),
    );
  }
}
