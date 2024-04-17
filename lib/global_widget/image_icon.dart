import 'package:flutter/material.dart';

class SelectImageButton extends StatelessWidget {
  const SelectImageButton(
      {super.key,
        this.height,
        this.width = 180,
        required this.onPressed,
        required this.icon,
        required this.label,
        this.borderRadius = 10,
        this.buttonBGColor = Colors.white,
        this.iconColor = Colors.black,
        this.labelColor = Colors.black,
        this.labelSize = 15});

  final double? height;
  final double? width;
  final Function() onPressed;
  final IconData icon;
  final String label;
  final double borderRadius;
  final Color buttonBGColor;
  final Color iconColor;
  final Color labelColor;
  final double labelSize;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: ElevatedButton.icon(
        onPressed: onPressed,
        style: ButtonStyle(
            shape: MaterialStatePropertyAll(
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(borderRadius))),
            backgroundColor: MaterialStatePropertyAll(buttonBGColor)),
        icon: Icon(icon, color: iconColor),
        label: Text(label, style: TextStyle(color: labelColor, fontSize: labelSize)),
      ),
    );
  }
}