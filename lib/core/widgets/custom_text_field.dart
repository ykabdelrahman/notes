import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    this.hint,
    this.onChanged,
    this.controller,
    this.textStyle,
    this.autoFocus = false,
    this.maxLines,
    this.isLastInput = false,
  });
  final String? hint;
  final bool autoFocus;
  final Function(String)? onChanged;
  final TextEditingController? controller;
  final TextStyle? textStyle;
  final int? maxLines;
  final bool isLastInput;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChanged,
      controller: controller,
      autofocus: autoFocus,
      keyboardType: TextInputType.multiline,
      textCapitalization: TextCapitalization.sentences,
      style: textStyle,
      maxLines: maxLines,
      cursorColor: Colors.white,
      textInputAction:
          isLastInput ? TextInputAction.done : TextInputAction.next,
      decoration: InputDecoration.collapsed(
        hintText: hint,
      ),
    );
  }
}
