import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  final TextEditingController textcontroller;
  final String hintext;
  final String labelText;
  final double borderRadius;
  final int? maxLines;

  const TextFieldWidget(
      {super.key,
      required this.textcontroller,
      required this.hintext,
      required this.labelText,
      this.borderRadius = 12,
      this.maxLines = 1});

  @override
  Widget build(BuildContext context) {
    return TextField(
      maxLines: maxLines,
      controller: textcontroller,
      decoration: InputDecoration(
          filled: true,
          //fillColor: Colors.grey,
          hintText: hintext,
          labelText: labelText,
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(borderRadius),
              borderSide: const BorderSide(color: Colors.white, width: 1)),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(borderRadius),
              borderSide: const BorderSide(color: Colors.yellow, width: 1))),
    );
  }
}
