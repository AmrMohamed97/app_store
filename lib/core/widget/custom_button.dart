import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {this.color, required this.onTab, super.key, required this.label});
  final String label;
  final VoidCallback? onTab;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTab,
      child: Container(
        width: double.infinity,
        height: 60,
        decoration: BoxDecoration(
          color: color ?? Colors.white,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
          child: Text(
            label,
            style: TextStyle(
              color: color == Colors.white ? Colors.black : Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
