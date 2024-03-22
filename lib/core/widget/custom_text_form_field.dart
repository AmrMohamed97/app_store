import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField(
      {Key? key,
      this.onChanged,
      this.hintText,
      this.controller,
      this.keyboardType,
      this.obscureText = false})
      : super(key: key);
  final String? hintText;
  final Function(String)? onChanged;
  final TextEditingController? controller;
  final bool obscureText;
  final TextInputType? keyboardType;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
          borderSide: BorderSide(),
        ),
        enabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
          borderSide: BorderSide(),
        ),
        focusedBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
          borderSide: BorderSide(),
        ),
        hintText: hintText,
        hintStyle: const TextStyle(),
      ),
      keyboardType: keyboardType,
      onChanged: onChanged,
      controller: controller,
      obscureText: obscureText,
    );
  }
}
