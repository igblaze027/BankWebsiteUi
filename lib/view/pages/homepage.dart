// import 'package:bankwebsite/Widget/card.dart';
// import 'package:bankwebsite/Widget/customPaint.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';

// class ProgressiveCardScreen extends StatefulWidget {
//   const ProgressiveCardScreen({super.key});

//   @override
//   // ignore: library_private_types_in_public_api
//   _ProgressiveCardScreenState createState() => _ProgressiveCardScreenState();
// }

// class _ProgressiveCardScreenState extends State<ProgressiveCardScreen>
//     with SingleTickerProviderStateMixin {
//   late AnimationController _controller;
//   late Animation<double> _lineAnimation;
//   double linePosition = 0;

//   final double cardWidth = 200; // Smaller card width
//   final double cardHeight = 300; // Smaller card height

//   @override
//   void initState() {
//     super.initState();
//     _controller = AnimationController(
//       vsync: this,
//       duration: const Duration(seconds: 8),
//     );

//     _lineAnimation = Tween<double>(
//       begin: MediaQueryData.fromView(WidgetsBinding.instance.window)
//           .size
//           .width, // Start from screen width
//       end: 0, // Move to the left
//     ).animate(CurvedAnimation(
//       parent: _controller,
//       curve: Curves.linear,
//     ))
//       ..addListener(() {
//         setState(() {
//           linePosition = _lineAnimation.value;
//         });
//       });

//     _controller.repeat();
//   }

//   @override
//   Widget build(BuildContext context) {
//     final screenWidth = MediaQuery.of(context).size.width;

//     return Scaffold(
//       body: Stack(
//         children: [
//           // Background with gradient, blur, and curve
//           CustomPaint(
//             size: MediaQuery.of(context).size,
//             painter: ReversedGradientPainter(),
//           ),
//           Positioned(
//             bottom: 300,
//             top: 100,
//             child: Container(
//               height: 200,
//               width: screenWidth,
//               color: Colors.black,
//             ),
//           ),
//           // First Clipped Card
//           Positioned(
//             top: 100,
//             left: 50,
//             child: ClipRect(
//               clipper: CardClipper(linePosition - 50, cardWidth),
//               // child: Container(
//               //   width: cardWidth,
//               //   height: cardHeight,
//               //   color: Colors.blue,
//               //   child: const Center(
//               //     child: Text(
//               //       'Card 1',
//               //       style: TextStyle(
//               //         color: Colors.white,
//               //         fontSize: 20,
//               //       ),
//               //     ),
//               //   ),
//               // ),
//               child: Image.asset(
//                 'assets/PurpleCard.png',
//                 width: cardWidth,
//                 height: cardHeight,
//                 fit: BoxFit.cover,
//                 errorBuilder: (context, error, stackTrace) {
//                   return const Center(
//                     child: Text(
//                       'Image not found',
//                       style: TextStyle(color: Colors.red),
//                     ),
//                   );
//                 },
//               ),
//             ),
//           ),

//           // Second Clipped Card
//           Positioned(
//             top: 100,
//             left: 300,
//             child: ClipRect(
//               clipper: CardClipper(linePosition - 300, cardWidth),
//               child: Image.asset(
//                 'assets/whiteCard.png',
//                 width: cardWidth,
//                 height: cardHeight,
//                 fit: BoxFit.cover,
//                 errorBuilder: (context, error, stackTrace) {
//                   return const Center(
//                     child: Text(
//                       'Image not found',
//                       style: TextStyle(color: Colors.red),
//                     ),
//                   );
//                 },
//               ),
//               // child: Container(
//               //   width: cardWidth,
//               //   height: cardHeight,
//               //   color: Colors.blue,
//               //   child: const Center(
//               //     child: Text(
//               //       'Card 1',
//               //       style: TextStyle(
//               //         color: Colors.white,
//               //         fontSize: 20,
//               //       ),
//               //     ),
//               //   ),
//               // ),
//             ),
//           ),

//           // Moving Line
//           Positioned(
//             right: screenWidth - linePosition,
//             top: 0,
//             child: Container(
//               width: 2,
//               height: MediaQuery.of(context).size.height,
//               color: Colors.red,
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }
// }

// ignore_for_file: sized_box_for_whitespace

import 'package:bankwebsite/Widget/CurvedContainer.dart';
import 'package:bankwebsite/Widget/card.dart';
import 'package:bankwebsite/Widget/customPaint.dart';
import 'package:bankwebsite/Widget/linearText.dart';
import 'package:bankwebsite/Widget/violetcontainer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class ProgressiveCardScreen extends StatefulWidget {
  const ProgressiveCardScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ProgressiveCardScreenState createState() => _ProgressiveCardScreenState();
}

class _ProgressiveCardScreenState extends State<ProgressiveCardScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _lineAnimation;
  double linePosition = 0;

  final double cardWidth = 200; // Smaller card width
  final double cardHeight = 300; // Card height
  final double cardSpacing = 50; // Space between the cards

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 8),
    );

    _lineAnimation = Tween<double>(
      begin: MediaQueryData.fromView(WidgetsBinding.instance.window)
          .size
          .width, // Start from screen width
      end: 0, // Move to the left
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.linear,
    ))
      ..addListener(() {
        setState(() {
          linePosition = _lineAnimation.value;
        });
      });

    _controller.repeat();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    // Calculate horizontal positions for the cards
    final firstCardLeft = (screenWidth - 2 * cardWidth - cardSpacing) / 2;
    final secondCardLeft = firstCardLeft + cardWidth + cardSpacing;

    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            // Background with gradient, blur, and curve
            CustomPaint(
              size: MediaQuery.of(context).size,
              painter: ReversedGradientPainter(),
            ),
            Positioned(
              right: 370,
              top: 30,
              child: Container(
                height: 40,
                width: 600,
                decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 14, 13, 13),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(10),
                    ),
                    boxShadow: [
                      BoxShadow(
                          offset: const Offset(5, 5),
                          blurRadius: 7,
                          spreadRadius: 3,
                          blurStyle: BlurStyle.normal,
                          color: Colors.grey.shade900),
                    ]),
              ),
            ),

            Positioned(
              top: 20,
              // left: 270,
              left: 20,
              bottom: 600,
              child: Row(
                children: [
                  Container(
                    width: 50,
                    height: 50,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/Tcircle.png'),
                          fit: BoxFit.cover),
                    ),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  Text(
                    'NeXus',
                    style: TextStyle(
                      fontFamily: GoogleFonts.lobsterTwo().fontFamily,
                      color: Colors.white,
                      fontStyle: FontStyle.italic,
                      fontSize: 30,
                    ),
                  ),
                  Text(
                    'Pay',
                    style: TextStyle(
                      fontFamily: GoogleFonts.lobsterTwo().fontFamily,
                      color: Colors.white,
                      fontWeight: FontWeight.w100,
                      fontStyle: FontStyle.italic,
                      fontSize: 30,
                    ),
                  ),
                  const SizedBox(
                    width: 250,
                  ),
                  Row(
                    children: [
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          'Home',
                          style: TextStyle(
                              fontFamily:
                                  GoogleFonts.playfairDisplay().fontFamily,
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w100),
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          'Finance',
                          style: TextStyle(
                              fontFamily:
                                  GoogleFonts.playfairDisplay().fontFamily,
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w100),
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          'HR',
                          style: TextStyle(
                              fontFamily:
                                  GoogleFonts.playfairDisplay().fontFamily,
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w100),
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          'Pricing',
                          style: TextStyle(
                              fontFamily:
                                  GoogleFonts.playfairDisplay().fontFamily,
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w100),
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          'About',
                          style: TextStyle(
                              fontFamily:
                                  GoogleFonts.playfairDisplay().fontFamily,
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w100),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    width: 120,
                  ),
                  Container(
                    width: 100,
                    height: 50,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(10),
                        topLeft: Radius.circular(10),
                      ),
                      color: Colors.black,
                    ),
                    child: Center(
                      child: Text(
                        'Log in',
                        style: TextStyle(
                          fontFamily: GoogleFonts.playfairDisplay().fontFamily,
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: 200,
                    height: 50,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(10),
                        topRight: Radius.circular(10),
                      ),
                      color: Colors.white,
                    ),
                    child: Center(
                      child: Text(
                        'Create Account',
                        style: TextStyle(
                          fontFamily: GoogleFonts.playfairDisplay().fontFamily,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Positioned(
            //   bottom: 300,
            //   top: 100,
            //   child: Container(
            //     height: 200,
            //     width: screenWidth,
            //     color: Colors.black,
            //   ),
            // ),
            Positioned(
              bottom: 300,
              top: 100,
              child: Lottie.asset(
                fit: BoxFit.cover,
                'assets/nightStar.json',
                height: 70,
                width: screenWidth,
                errorBuilder: (context, error, stackTrace) {
                  return const Center(
                    child: Text(
                      'Failed to load animation',
                      style: TextStyle(color: Colors.red),
                    ),
                  );
                },
              ),
            ),
            Positioned(
              top: 350,
              left: MediaQuery.of(context).size.width / 2 - 450,
              child: Column(
                children: [
                  LinearText(
                    text: 'The Future Of Banking',
                    fontSize: 50,
                    fontWeight: FontWeight.w700,
                  ),
                  LinearText(
                    text: 'Empowering Financial Freedom, Anytime, Anywhere',
                    fontSize: 30,
                    fontWeight: FontWeight.w500,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  LinearText(
                    text:
                        'Empowering financial freedom with innovative solutions. At NeXusPay, ',
                    fontSize: 20,
                    fontWeight: FontWeight.w200,
                  ),
                  LinearText(
                    text:
                        'we simplify banking with secure, seamless, and accessible services tailored to meet your needs, ',
                    fontSize: 20,
                    fontWeight: FontWeight.w200,
                  ),
                  LinearText(
                    text:
                        'anytime, anywhere. Your trust drives us to deliver excellence every step of the way. ',
                    fontSize: 20,
                    fontWeight: FontWeight.w200,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 50,
                    width: 250,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                    ),
                    child: const Center(
                      child: Text(
                        'Talk to an expert',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  )
                ],
              ),
            ),
            // const Positioned(
            //   top: 369,
            //   child: VioletContainer(),
            // ),
            // const Positioned(top: 300, child: CurvedContainer()),
            // First Clipped Card
            Positioned(
              top: 100, // Fixed top position
              left: firstCardLeft,
              child: ClipRect(
                clipper: CardClipper(linePosition - firstCardLeft, cardWidth),
                child: Image.asset(
                  'assets/PurpleCard.png',
                  width: cardWidth,
                  height: cardHeight,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return const Center(
                      child: Text(
                        'Image not found',
                        style: TextStyle(color: Colors.red),
                      ),
                    );
                  },
                ),
              ),
            ),

            // Second Clipped Card
            Positioned(
              top: 100, // Fixed top position
              left: secondCardLeft,
              child: ClipRect(
                clipper: CardClipper(linePosition - secondCardLeft, cardWidth),
                child: Image.asset(
                  'assets/whiteCard.png',
                  width: cardWidth,
                  height: cardHeight,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return const Center(
                      child: Text(
                        'Image not found',
                        style: TextStyle(color: Colors.red),
                      ),
                    );
                  },
                ),
              ),
            ),

            // Moving Line
            Positioned(
              right: screenWidth - linePosition,
              top: 120, // Same as the card's top position
              child: Container(
                width: 2,
                height: cardHeight - 80,
                decoration: BoxDecoration(
                  color: Colors.deepPurpleAccent,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.deepPurple
                          .withOpacity(0.6), // Glow color with transparency
                      blurRadius: 15, // Controls the spread of the glow
                      spreadRadius: 5, // Additional spread for the glow
                    ),
                  ],
                ), // Same as the card height
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
