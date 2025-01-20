// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

import 'colorsPallete.dart';

typedef OnDropDownItemChanged<T> = void Function(T value);

class CustomDropDownList extends StatefulWidget {
  CustomDropDownList({
    Key? key,
    required this.onChanged,
    required this.dropdownItems,
    this.dropDownValue = '',
    this.showDropdown = false,
  }) : super(key: key);
  final List<String> dropdownItems;
  final bool showDropdown;
  String dropDownValue;
  final OnDropDownItemChanged<String> onChanged;

  @override
  CustomDropDownListState createState() => CustomDropDownListState();
}

class CustomDropDownListState extends State<CustomDropDownList> {
  String? selectedDropdownItem = '';
  @override
  Widget build(BuildContext context) {
    return DropdownButton(
      dropdownColor: Darkblue,
      iconEnabledColor: Darkblue,
      hint: widget.dropDownValue == ''
          ? const Text('Choose Your Business size')
          : Text(
              widget.dropDownValue,
              style: TextStyle(color: Darkblue),
            ),
      isExpanded: true,
      iconSize: 30.0,
      style: TextStyle(color: white),
      items: widget.dropdownItems.map(
        (val) {
          return DropdownMenuItem<String>(
            value: val,
            child: Text(val),
          );
        },
      ).toList(),
      onChanged: (val) {
        setState(
          () {
            widget.dropDownValue = val!;
          },
        );
        widget.onChanged(val!);
      },
    );
  }
}
