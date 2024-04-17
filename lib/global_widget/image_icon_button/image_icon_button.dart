import 'package:flutter/material.dart';

class ImageIconButton extends StatelessWidget {
  final double width;
  final double height;
  final Function() onPressed;
  final IconData icon;
  final String label;
  final Color iconColor;
  final Color buttonColor;

  const ImageIconButton({
    // Key key,
    required this.width,
    required this.height,
    required this.onPressed,
    required this.icon,
    required this.label,
    this.iconColor = Colors.black,
    this.buttonColor = Colors.grey,
  });

  // : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton.icon(
        style: ButtonStyle(
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          backgroundColor: MaterialStateProperty.all(buttonColor),
        ),
        onPressed: onPressed,
        icon: Icon(icon, color: iconColor),
        label: Text(
          label,
          style: TextStyle(color: Colors.black),
        ),
      ),
    );
  }
}
