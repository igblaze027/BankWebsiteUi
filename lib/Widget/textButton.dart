import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class textbutton extends StatefulWidget {
  final String text;
  final double fontSize;
  FontWeight? fontWeight;
  Color? color;
  String? fontFamily;
  TextStyle? textStyle;
  textbutton(
      {super.key,
      required this.text,
      required this.fontSize,
      required this.color,
      required this.fontFamily,
      required this.textStyle,
      required this.fontWeight});

  @override
  State<textbutton> createState() => _textbuttonState();
}

class _textbuttonState extends State<textbutton> {
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {},
      child: Text(
        widget.text,
        style: TextStyle(fontFamily: widget.fontFamily, color: widget.color),
      ),
    );
  }
}
