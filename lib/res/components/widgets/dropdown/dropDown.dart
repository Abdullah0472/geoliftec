// import 'package:flutter/material.dart';
// import 'package:geoliftec/res/colors/colors.dart';
//
// class DropDown extends StatefulWidget {
//   final Function(String?) onSelected;
//   final TextEditingController dropDownController;
//
//   const DropDown({Key? key, required this.onSelected, required this.dropDownController}) : super(key: key);
//
//   @override
//   State<DropDown> createState() => _DropDownState();
// }
//
// class _DropDownState extends State<DropDown> {
//
//   String dropdownValue = "Good";
//
//   var items = [
//     'Good',
//     'Bad',
//   ];
//
//   @override
//   void initState() {
//     super.initState();
//     widget.dropDownController.text = dropdownValue;
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return DropdownButtonFormField<String>(
//       style: const TextStyle(color: AppColor.drakerColor, fontSize: 18, fontWeight: FontWeight.w500), // update text color to black
//       dropdownColor: AppColor.whiteColor, // update dropdown menu color to white
//       iconEnabledColor: AppColor.drakerColor,
//       decoration: InputDecoration(
//         contentPadding: const EdgeInsets.symmetric(
//           horizontal: 16.0,
//           vertical: 12.0,
//         ),
//         enabledBorder: OutlineInputBorder(
//           borderSide: BorderSide(
//             color: Colors.grey[400]!,
//             width: 1.0,
//           ),
//           borderRadius: BorderRadius.circular(8.0),
//         ),
//         focusedBorder: OutlineInputBorder(
//           borderSide: BorderSide(
//             color: Theme.of(context).colorScheme.secondary,
//             width: 2.0,
//           ),
//           borderRadius: BorderRadius.circular(8.0),
//         ),
//         filled: true,
//         fillColor: AppColor.whiteColor,
//
//         errorBorder: OutlineInputBorder(
//           borderSide: BorderSide(
//             color: Theme.of(context).colorScheme.error,
//             width: 1.0,
//           ),
//           borderRadius: BorderRadius.circular(8.0),
//         ),
//         focusedErrorBorder: OutlineInputBorder(
//           borderSide: BorderSide(
//             color: Theme.of(context).colorScheme.error,
//             width: 2.0,
//           ),
//           borderRadius: BorderRadius.circular(8.0),
//         ),
//       ),
//       value: dropdownValue,
//       items: items.map((item) {
//         return DropdownMenuItem(
//           value: item,
//           child: Text(item),
//         );
//       }).toList(),
//       onChanged: (value) {
//         setState(() {
//           dropdownValue = value!;
//           widget.dropDownController.text = dropdownValue;
//         });
//         widget.onSelected(dropdownValue);
//       },
//       onSaved: (value) {
//         widget.dropDownController.text = value ?? '';
//       },
//     );
//
//   }
// }
/// -----------------CHATGPT Code ----------------///

import 'package:flutter/material.dart';
import 'package:geoliftec/res/colors/colors.dart';

class DropDown extends StatefulWidget {
  final Function(String?) onSelected;
  final TextEditingController dropDownController;
  final double hintSize;

  const DropDown({Key? key, required this.onSelected, required this.dropDownController,  this.hintSize = 18}) : super(key: key);

  @override
  State<DropDown> createState() => _DropDownState();
}

class _DropDownState extends State<DropDown> {

  String? dropdownValue;

  var items = [    'Good',    'Bad',  ];

  @override
  void initState() {
    super.initState();
    widget.dropDownController.text = '';
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      hint:  Text('Select Condition',style: TextStyle(
        color: AppColor.lightgreyColor,
        fontSize: widget.hintSize,
      ),),

      validator: (value) => value == null || value.isEmpty ? 'Please select a value' : null,
      style: const TextStyle(color: AppColor.drakerColor, fontSize: 18, fontWeight: FontWeight.w500), // update text color to black
      dropdownColor: AppColor.whiteColor, // update dropdown menu color to white
      iconEnabledColor: AppColor.drakerColor,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16.0,
          vertical: 12.0,
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.grey[400]!,
            width: 1.0,
          ),
          borderRadius: BorderRadius.circular(8.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Theme.of(context).colorScheme.secondary,
            width: 2.0,
          ),
          borderRadius: BorderRadius.circular(8.0),
        ),
        filled: true,
        fillColor: AppColor.whiteColor,

        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Theme.of(context).colorScheme.error,
            width: 1.0,
          ),
          borderRadius: BorderRadius.circular(8.0),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Theme.of(context).colorScheme.error,
            width: 2.0,
          ),
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
      value: dropdownValue,
      items: items.map((item) {
        return DropdownMenuItem(
          value: item,
          child: Text(item),
        );
      }).toList(),
      onChanged: (value) {
        setState(() {
          dropdownValue = value!;
          widget.dropDownController.text = dropdownValue!;
        });
        widget.onSelected(dropdownValue);
      },
      onSaved: (value) {
        widget.dropDownController.text = value ?? '';
      },
    );

  }
}
