import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextFieldNumberWidget extends StatelessWidget {
  final TextEditingController textcontroller;
  final String hintext;
  final String labelText;
  final double borderRadius;
  final int? maxLines;
  final String? obsCureText;

  TextFieldNumberWidget(
      {super.key,
      required this.textcontroller,
      required this.hintext,
      required this.labelText,
      this.borderRadius = 12,
      this.maxLines = 1,
      this.obsCureText});

  @override
  Widget build(BuildContext context) {
    return TextField(
      // keyboardType: TextInputType.number,
      keyboardType: TextInputType.number,
      inputFormatters: <TextInputFormatter>[
        FilteringTextInputFormatter.digitsOnly
      ],
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
