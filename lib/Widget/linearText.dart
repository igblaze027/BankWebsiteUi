import 'package:flutter/material.dart';

class LinearText extends StatefulWidget {
  final String text;
  final double fontSize;
  FontWeight fontWeight;
  LinearText(
      {super.key,
      required this.text,
      required this.fontSize,
      required this.fontWeight});

  @override
  State<LinearText> createState() => _LinearTextState();
}

class _LinearTextState extends State<LinearText> {
  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (bounds) => const LinearGradient(
        colors: [
          Color.fromARGB(87, 255, 253, 253),
          Colors.white, // Start color
          Color.fromARGB(87, 255, 253, 253),
        ],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ).createShader(
        Rect.fromLTWH(0, 0, bounds.width, bounds.height),
      ),
      child: Text(
        widget.text,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
          fontSize: widget.fontSize,
          fontWeight: widget.fontWeight,
          color: Colors.white, // The color must be white to show the gradient
        ),
      ),
    );
  }
}
