import 'package:flutter/material.dart';

import '../Helpers/Colors.dart';
import 'CustomText.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final Color color;
  final double height;
  final double width;
  final double borderRadius;
  final Color textColor;
  final FontWeight fontWeight;
  final double fontSize;
  final Function onPressed;

  const CustomButton(
      {@required this.text,
      this.color = const Color.fromARGB(255, 156, 39, 176),
      this.height = 50,
      this.width = double.infinity,
      this.borderRadius = 8.0,
      this.textColor = Colors.white,
      this.fontWeight = FontWeight.normal,
      this.fontSize = 18,
      this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      child: TextButton(
        style: TextButton.styleFrom(
            backgroundColor: primaryColor,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(borderRadius))),
        child: CustomText(
          text: text,
          fontSize: fontSize,
          color: textColor,
          fontWeight: fontWeight,
        ),
        onPressed: onPressed,
      ),
    );
  }
}
