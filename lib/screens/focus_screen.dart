import 'package:flutter/material.dart';

// A stateless widget for the Focus Screen
class FocusScreen extends StatelessWidget {
  const FocusScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea( // Ensures UI stays within safe boundaries (notch, status bar, etc.)
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            _buildAppBar(), // Custom app bar with back & settings buttons
            const SizedBox(height: 50),
            _buildReadyToFocusText(), // "READY TO FOCUS" header
            const SizedBox(height: 30),
            _buildFlightInfo(), // Displays flight info (DXB -> SEO)
            const SizedBox(height: 30),
            _buildBoardingPass(), // Ticket UI with peel + barcode
            const Spacer(), // Pushes button to bottom of the screen
            _buildBoardingButton(), // Boarding button
          ],
        ),
      ),
    );
  }

  // Builds the custom top bar with back & settings icons
  Widget _buildAppBar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // Back button (left)
        Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: Colors.black, width: 2),
          ),
          child: const Icon(Icons.arrow_back, color: Colors.black, size: 24),
        ),
        // Settings button (right)
        Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: Colors.black, width: 2),
          ),
          child: const Icon(Icons.settings, color: Colors.black, size: 24),
        ),
      ],
    );
  }

  // "READY TO FOCUS" header text
  Widget _buildReadyToFocusText() {
    return const Text(
      'READY TO FOCUS',
      style: TextStyle(
        fontFamily: 'SF Pro Display',
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: Colors.black,
        letterSpacing: 2,
      ),
    );
  }

  // Flight route info (DXB -> SEO with flight icon)
  Widget _buildFlightInfo() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        Text(
          'DXB',
          style: TextStyle(
            fontFamily: 'SF Pro Display',
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        SizedBox(width: 20),
        Icon(Icons.flight, size: 30, color: Colors.black),
        SizedBox(width: 20),
        Text(
          'SEO',
          style: TextStyle(
            fontFamily: 'SF Pro Display',
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ],
    );
  }

  // Boarding pass container with peel text and barcode
  Widget _buildBoardingPass() {
    return Container(
      width: 250,
      height: 300,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.black, width: 3),
        boxShadow: const [
          // Shadow effect to simulate depth
          BoxShadow(
            color: Colors.black,
            spreadRadius: 0,
            blurRadius: 0,
            offset: Offset(8, 8), // Offset for shadow (bottom-right)
          ),
        ],
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Main ticket text & barcode
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'PEEL THE',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'SF Pro Display',
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  letterSpacing: 1.5,
                ),
              ),
              const Text(
                'TICKET TO',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'SF Pro Display',
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  letterSpacing: 1.5,
                ),
              ),
              const Text(
                'BOARD',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'SF Pro Display',
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  letterSpacing: 1.5,
                ),
              ),
              const SizedBox(height: 30),
              // Barcode row with scissors
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Icon(
                      Icons.content_cut,
                      color: Colors.black,
                      size: 30,
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Image.asset(
                          'assets/barcode.png', // Barcode image (add in assets folder)
                          fit: BoxFit.fill,
                          height: 50,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          // Bottom edge to simulate ticket cut
          Positioned(
            bottom: -1,
            child: Container(
              width: 245,
              height: 25,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(15),
                  bottomRight: Radius.circular(15),
                ),
                border: Border(
                  top: BorderSide(
                    color: Colors.black,
                    width: 3,
                    style: BorderStyle.solid,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Bottom "BOARDING" button
  Widget _buildBoardingButton() {
    return Container(
      width: double.infinity,
      height: 60,
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Colors.black, width: 2),
      ),
      child: const Center(
        child: Text(
          'BOARDING',
          style: TextStyle(
            fontFamily: 'SF Pro Display',
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.black,
            letterSpacing: 1.5,
          ),
        ),
      ),
    );
  }
}
