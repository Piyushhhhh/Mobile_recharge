import 'package:flutter/material.dart';

Widget buildTextField({
  required TextEditingController controller,
  required String hintText,
  required Widget prefixIcon,
  TextInputType keyboardType = TextInputType.text,
}) {
  return TextField(
    controller: controller,
    decoration: InputDecoration(
      hintText: hintText,
      prefixIcon: prefixIcon,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    ),
    keyboardType: keyboardType,
  );
}

Widget buildElevatedButton({
  required VoidCallback onPressed,
  required String label,
  Color backgroundColor = Colors.blue,
  Color textColor = Colors.white,
  double buttonHeight = 50.0,
  double fontSize = 15.0,
}) {
  return ElevatedButton(
    onPressed: onPressed,
    style: ElevatedButton.styleFrom(
      minimumSize: Size(double.infinity, buttonHeight),
      backgroundColor: backgroundColor,
    ),
    child: Text(
      label,
      style: TextStyle(color: textColor, fontSize: fontSize),
    ),
  );
}
