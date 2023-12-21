// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Button extends StatelessWidget {
  final VoidCallback? onPressed;
  final String svgAssetPath;
  final String buttonText;
  final Color textColor;
  final Color backgroundColor;
  final Color iconColor; // New property for icon color

  const Button({
    Key? key,
    this.onPressed,
    required this.svgAssetPath,
    required this.buttonText,
    this.textColor = Colors.black,
    this.backgroundColor = Colors.transparent,
    this.iconColor = Colors.black,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          backgroundColor: backgroundColor,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(7.0)),
          ),
        ),
        child: Row(
          children: [
            SvgPicture.asset(
              svgAssetPath,
              width: 18,
              height: 18,
              color: iconColor,
            ),
            const SizedBox(width: 8),
            Text(
              buttonText,
              style: TextStyle(
                color: textColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
