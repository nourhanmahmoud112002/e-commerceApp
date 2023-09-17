import 'package:e_commerce_app/constants.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField(
      {this.onChanged,
      this.onSubmitted,
      required this.label,
      this.obscureText = false,
      this.suffix_icon,
      required this.icon});
  String? label;

  Function(String)? onChanged;
  Function(String)? onSubmitted;
  bool? obscureText;
  Icon icon;
  Icon? suffix_icon;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: TextFormField(
        obscureText: obscureText!,
        validator: (data) {
          if (data!.isEmpty) {
            return 'Field is required';
          }
        },
        onChanged: onChanged,
        onFieldSubmitted: onSubmitted,
        decoration: InputDecoration(
            prefixIcon: icon,
            prefixIconColor: kprimaryColor,
            suffixIcon: suffix_icon,
            // suffixIconColor: Colors.black,
            // hintText: hintText,
            label: Text(
              label!,
              style: const TextStyle(fontSize: 18, color: Colors.grey),
            ),
            enabledBorder: OutlineInputBorder(
                gapPadding: 16,
                borderSide: BorderSide(
                  color: kprimaryColor,
                ),
                borderRadius: const BorderRadius.all(Radius.circular(32))),
            border: OutlineInputBorder(
                gapPadding: 16,
                borderSide: BorderSide(
                  color: kprimaryColor,
                ),
                borderRadius: const BorderRadius.all(Radius.circular(32))),
            focusedBorder: OutlineInputBorder(
                gapPadding: 16,
                borderSide: BorderSide(
                  color: kprimaryColor,
                ),
                borderRadius: const BorderRadius.all(Radius.circular(32)))),
      ),
    );
  }
}
