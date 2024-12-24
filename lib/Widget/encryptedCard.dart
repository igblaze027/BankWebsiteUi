import 'package:flutter/material.dart';

class EncryptedCard extends StatefulWidget {
  const EncryptedCard({super.key});

  @override
  State<EncryptedCard> createState() => _EncryptedCardState();
}

class _EncryptedCardState extends State<EncryptedCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Image.asset(
        height: 100,
        width: 10,
        'assets/cardof.jpg',
      ),
    );
  }
}
