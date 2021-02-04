import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final String text;
  final double width, height;
  final Color color;

  const Button(
      {@required this.text,
      this.width = 170.0,
      this.height = 45.0,
      this.color = Colors.orange});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: () {},
      highlightElevation: 0,
      elevation: 0,
      minWidth: this.width,
      height: this.height,
      color: this.color,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100.0)),
      child: Text(
        '$text',
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
