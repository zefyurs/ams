import 'package:flutter/material.dart';

class GreyEmptyBoxContainer extends StatelessWidget {
  final Widget widget;
  final double borderRadius;
  const GreyEmptyBoxContainer({super.key, required this.widget, required this.borderRadius});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(borderRadius),
          border: Border.all(
            color: Colors.grey.withOpacity(0.4),
            width: 1,
          ),
        ),
        child: widget);
  }
}
