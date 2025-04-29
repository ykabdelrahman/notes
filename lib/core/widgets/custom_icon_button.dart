import 'package:flutter/material.dart';
import '../utils/constants.dart';

class CustomIconButton extends StatelessWidget {
  const CustomIconButton({
    super.key,
    this.onPressed,
    required this.icon,
  });
  final VoidCallback? onPressed;
  final Widget icon;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 50,
      decoration: BoxDecoration(
        color: CustomColors.lightGrey,
        borderRadius: BorderRadius.circular(16),
      ),
      child: IconButton(
        onPressed: onPressed,
        icon: icon,
        iconSize: 26,
      ),
    );
  }
}
