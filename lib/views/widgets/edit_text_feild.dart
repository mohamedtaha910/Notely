import 'package:flutter/material.dart';
import 'package:notes_app/constants.dart';

class CustomEditTextFeild extends StatefulWidget {
  const CustomEditTextFeild({
    super.key,
    required this.text,
    this.height = 1.0,
    this.onSaved,
    this.onChanged,
  });
  final String text;
  final double height;
  final void Function(String)? onChanged;
  final void Function(String?)? onSaved;

  @override
  State<CustomEditTextFeild> createState() => _CustomEditTextFeildState();
}

class _CustomEditTextFeildState extends State<CustomEditTextFeild> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.text);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: _controller,
      onChanged: widget.onChanged,
      validator: (value) {
        if (value?.isEmpty ?? true) {
          return 'Feild Is Required';
        } else {
          return null;
        }
      },
      maxLines: widget.height.toInt(),
      onSaved: widget.onSaved,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white.withAlpha(5),
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
