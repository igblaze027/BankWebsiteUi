import 'package:flutter/material.dart';

class CardClipper extends CustomClipper<Rect> {
  final double linePosition;
  final double cardWidth;

  CardClipper(this.linePosition, this.cardWidth);

  @override
  Rect getClip(Size size) {
    if (linePosition <= 0) {
      return Rect.zero;
    } else if (linePosition < cardWidth) {
      return Rect.fromLTWH(0, 0, linePosition, size.height);
    } else {
      return Rect.fromLTWH(0, 0, size.width, size.height);
    }
  }

  @override
  bool shouldReclip(CardClipper oldClipper) {
    return linePosition != oldClipper.linePosition;
  }
}
