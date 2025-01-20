import 'package:flutter/material.dart';

Widget defaultFormField({
  bool filled = true,
  bool ispassword = true,
  Color? fillColor,
  Color? prefixIconColor,
  TextStyle? hintStyle,
  TextStyle? textStyle,
  TextStyle? labelStyle,
  String? hint,
  required TextEditingController controller,
  required TextInputType type,
  Icon? prefixicon,
  IconData? suffixicon,
  Function? suffixPress,
  required String labelText,
  required Function validate,
  Function? onsubmit,
  Function? ontap,
  String? initialVal,
}) =>
    TextFormField(
      initialValue: initialVal,
      controller: controller,
      keyboardType: type,
      obscureText: ispassword,
      validator: (value) {
        return validate(value);
      },
      onTap: () {
        ontap!();
      },
      style: textStyle,
      decoration: InputDecoration(
        
        hintText: hint,
        hintStyle: hintStyle,
        filled: filled,
        fillColor: fillColor,
        prefixIcon: prefixicon,
        prefixIconColor: prefixIconColor,
        suffixIcon: IconButton(
          icon: Icon(suffixicon),
          onPressed: () {
            suffixPress!();
          },
        ),
        labelText: labelText,
        labelStyle: labelStyle,
        border: const OutlineInputBorder(),
      ),
    );
