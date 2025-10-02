import 'package:flutter/material.dart';
class FocusScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            _buildAppBar(),
            const SizedBox(height: 50),
            _buildReadyToFocusText(),
            const SizedBox(height: 50),
            _buildFlightInfo(),
            const SizedBox(height: 30),
            _buildBoardingPass(),
            const Spacer(),
            _buildBoardingButton(),
          ],
        ),
      ),
    );
  }

  Widget _buildAppBar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: Colors.black, width: 2),
          ),
          child: const Icon(Icons.arrow_back, color: Colors.black, size: 24),
        ),
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

  Widget _buildReadyToFocusText() {
    return const Text(
      'READY TO FOCUS',
      style: TextStyle(
        fontFamily: 'SF Pro Display', // Assuming a similar font to SF Pro
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: Colors.black,
        letterSpacing: 2,
      ),
    );
  }

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

  Widget _buildBoardingPass() {
    return Container(
      width: 250, // Adjusted width to better match the screenshot
      height: 300, // Adjusted height
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.black, width: 3),
        boxShadow: const [
          BoxShadow(
            color: Colors.black,
            spreadRadius: 0,
            blurRadius: 0,
            offset: Offset(8, 8), // Right and bottom offset for the shadow effect
          ),
        ],
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
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
              // Barcode and scissors
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Icon(Icons.content_cut, color: Colors.black, size: 30),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Image.asset(
                          'assets/barcode.png', // You'll need to add a barcode image to your assets
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
          Positioned(
            bottom: -1, // Adjust to make it look like part of the border cutting
            child: Container(
              width: 245, // Slightly less than the outer container
              height: 25,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(15),
                  bottomRight: Radius.circular(15),
                ),
                border: Border(
                  top: BorderSide(color: Colors.black, width: 3, style: BorderStyle.solid), // Dashed line
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

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