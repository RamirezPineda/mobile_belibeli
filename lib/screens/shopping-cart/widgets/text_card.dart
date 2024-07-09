import 'package:flutter/material.dart';

class TextCard extends StatelessWidget {
  final String title;
  final String subTitle;
  final Color? color;
  final FontWeight? fontWeight;
  final double? fontSize;

  const TextCard({
    super.key,
    required this.title,
    required this.subTitle,
    this.color,
    this.fontWeight,
    this.fontSize,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
            color: color,
            fontWeight: fontWeight ?? FontWeight.w600,
            fontSize: fontSize,
          ),
        ),
        Text(
          subTitle,
          style: TextStyle(
            color: color,
            fontWeight: fontWeight ?? FontWeight.w600,
            fontSize: fontSize,
          ),
        ),
      ],
    );
  }
}
