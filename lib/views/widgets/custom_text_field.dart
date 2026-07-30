import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:notes_app/constants.dart';

class CustomTextFeild extends StatelessWidget {
  const CustomTextFeild({
    super.key,
    required this.hint,
    this.height = 1.0,
    this.onSaved,
    this.onChanged,
  });
  final String hint;
  final double height;
  final void Function(String)? onChanged;
  final void Function(String?)? onSaved;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChanged,
      validator: (value) {
        if (value?.isEmpty ?? true) {
          return 'Feild Is Required';
        } else {
          return null;
        }
      },

      maxLines: height.toInt(),
      onSaved: onSaved,
      decoration: InputDecoration(
        hintText: hint,
        filled: true,
        fillColor: Colors.white.withAlpha(5),

        // hintMaxLines: maxLines,
        hintStyle: TextStyle(
          color: const Color.fromARGB(255, 125, 121, 121),
          // height: height,
        ),

        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: Colors.grey.withAlpha(100), width: 0.8),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: Colors.grey.withAlpha(100), width: 0.8),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: kPrimaryColor, width: 0.9),
        ),
      ),
    );
  }
}
