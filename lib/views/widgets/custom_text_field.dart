import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    this.hint,
    this.onChanged,
    this.controller,
    this.textStyle,
    this.autoFocus = false,
  });
  final String? hint;
  final bool autoFocus;
  final Function(String)? onChanged;
  final TextEditingController? controller;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChanged,
      controller: controller,
      autofocus: autoFocus,
      keyboardType: TextInputType.multiline,
      textCapitalization: TextCapitalization.sentences,
      style: textStyle,
      maxLines: null,
      decoration: InputDecoration.collapsed(
        hintText: hint,
      ),
    );
  }
}
