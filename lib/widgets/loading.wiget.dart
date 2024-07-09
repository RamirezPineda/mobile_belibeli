import 'package:flutter/material.dart';

class Loading extends StatelessWidget {
  final Color? color;
  const Loading({super.key, this.color});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 20,
      height: 20,
      child: CircularProgressIndicator(
        color: color ?? Colors.white,
        strokeWidth: 4,
      ),
    );
  }
}
