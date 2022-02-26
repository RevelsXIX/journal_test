import 'package:flutter/material.dart';

class CustomDropDownButton extends StatefulWidget {

  final onSaved;

  const CustomDropDownButton({Key? key, required this.onSaved}) : super(key: key);

  @override
  State<CustomDropDownButton> createState() => _CustomDropDownButtonState();

}

class _CustomDropDownButtonState extends State<CustomDropDownButton> {

  int? selectedValue;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
      decoration: InputDecoration(
        hintText: 'Select a Rating',
        border: OutlineInputBorder()
      ),
        validator: (value) => value == null ? "Select a rating" : null,
        value: selectedValue,
        items: dropdownItems,
        onChanged: (int? newValue) {
          setState(() {
            selectedValue = newValue!;
          });
        },
      );
    }
  }

final ratingSelected = TextEditingController();

List<DropdownMenuItem<int>> get dropdownItems{
  List<DropdownMenuItem<int>> menuItems = [
    DropdownMenuItem(child: Text("1"),value: 1),
    DropdownMenuItem(child: Text("2"),value: 2),
    DropdownMenuItem(child: Text("3"),value: 3),
    DropdownMenuItem(child: Text("4"),value: 4),
    DropdownMenuItem(child: Text("5"),value: 5)
  ];
  return menuItems;
}