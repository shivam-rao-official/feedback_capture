import 'package:feedback_capture/consts/app_fonts.dart';
import 'package:flutter/material.dart';

class CustomTextfield extends StatelessWidget {
  final String hintText;
  final IconData icon;
  const CustomTextfield({Key? key, required this.hintText, required this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      validator: (input) =>
          input!.contains("@") ? "Enter valid email id" : null,
      style: const TextStyle(
        fontSize: AppFonts.fontSize,
      ),
      // onSaved: (value) => _email = value!,
      textAlignVertical: TextAlignVertical.center,
      decoration: InputDecoration(
        hintText: hintText,
        prefixIcon: Icon(icon, size: 20.0),
        // border: InputBorder.none,
      ),
    );
  }
}
