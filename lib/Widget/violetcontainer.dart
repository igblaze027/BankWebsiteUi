import 'package:flutter/material.dart';

class VioletContainer extends StatefulWidget {
  const VioletContainer({super.key});

  @override
  State<VioletContainer> createState() => _VioletContainerState();
}

class _VioletContainerState extends State<VioletContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color.fromARGB(255, 29, 7, 32),
            Colors.purple // Black at the bottom
          ],
          stops: [0.4, 1.0], // Smooth gradient transition
        ),
      ),
    );
  }
}
